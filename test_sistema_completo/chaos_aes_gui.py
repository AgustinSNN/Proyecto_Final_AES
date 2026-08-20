#!/usr/bin/env python3
"""
Chaotic-AES FPGA Controller GUI
=================================

A Tkinter desktop app that talks to an FPGA implementation of AES whose
S-box generation and key expansion are driven by chaotic maps, over an
RS-232 serial link (pyserial).

------------------------------------------------------------------------
PROTOCOL (host <-> FPGA)
------------------------------------------------------------------------
The FPGA FSM only interprets a single command byte per action -- there is
NO start/end framing and NO length/checksum byte. Payload bytes (only
used for the key and plaintext going out, or result data coming back)
immediately follow the command byte, with a length implied by the
command itself. There is no ACK/NACK handshake -- the FPGA does not send
one, and it does NOT prefix its replies with any kind of response opcode
either.

Commands (PC -> FPGA), no framing, just raw bytes on the wire:

    0x01                      SELECT_AES_128 (+ optional key payload)
    0x02                      SELECT_AES_192 (+ optional key payload)
    0x03                      SELECT_AES_256 (+ optional key payload)
    0x10 + i                  SELECT_SBOX_CHAOS_BLOCK[i]   (no payload)
    0x20 + i                  SELECT_KEYEXP_CHAOS_BLOCK[i] (no payload)
    0x30                      LOAD_PLAINTEXT        payload = 16 bytes
                                                     (the FPGA starts
                                                      encrypting as soon as
                                                      it has received it --
                                                      no separate start
                                                      command needed)
    0x40                      REQUEST_CIPHERTEXT    (no payload; asks the
                                                      FPGA for the 16-byte
                                                      ciphertext of the last
                                                      encryption)
    0x50                      REQUEST_KEY_EXPANSION (no payload; asks the
                                                      FPGA for its generated
                                                      expanded key/round keys)
    0x60                      REQUEST_SBOX          (no payload; asks the
                                                      FPGA for its generated
                                                      S-box)

    where `i` is the zero-based index into CHAOTIC_BLOCKS below, e.g. if
    CHAOTIC_BLOCKS[0] == "Logistic Map", sending byte 0x10 selects the
    Logistic Map for S-box generation, 0x20 selects it for key expansion.

Responses (FPGA -> PC): the FPGA sends back ONLY raw result bytes -- no
command byte, no header, nothing to identify what the data is. The host
therefore only reads data right after it has sent one of the three
REQUEST_* commands above, and already knows what it's getting because it
just asked for it:

    after REQUEST_CIPHERTEXT     -> next 16 bytes are the ciphertext
    after REQUEST_SBOX           -> next 256 bytes are the S-box
    after REQUEST_KEY_EXPANSION  -> next 176/208/240 bytes are the round
                                     keys, depending on whether AES-128 /
                                     AES-192 / AES-256 is currently selected

This is implemented by ResponseCollector below: sending a REQUEST_*
command calls collector.expect(purpose, length), and any bytes that show
up with nothing currently expected are logged as "unexpected" and
dropped, since there is no way to know what they'd mean. Edit CMD_* below
to match your RTL if your opcode map differs.
------------------------------------------------------------------------
"""

import os
import queue
import threading
import time
import tkinter as tk
from tkinter import ttk, messagebox

try:
    import serial
    import serial.tools.list_ports as list_ports
except ImportError:
    raise SystemExit(
        "pyserial is required. Install it with:\n\n    pip install pyserial\n"
    )


# =========================================================================
# PROTOCOL DEFINITION  (edit this section to match your FPGA firmware)
# =========================================================================

CMD_SELECT_AES_128 = 0x01
CMD_SELECT_AES_192 = 0x02
CMD_SELECT_AES_256 = 0x03

CMD_SBOX_BLOCK_BASE = 0x10     # + chaotic-block index
CMD_KEYEXP_BLOCK_BASE = 0x20   # + chaotic-block index

#CMD_LOAD_KEY = 0x30           uso los comandos de AES_Version para mandar la clave 
CMD_LOAD_PLAINTEXT = 0x30
#CMD_START_ENCRYPT = 0x32      la FPGA empieza a encriptar despues de recibir el plaintext

CMD_REQUEST_CIPHERTEXT = 0x40
CMD_REQUEST_KEY_EXPANSION = 0x50
CMD_REQUEST_SBOX = 0x60

# Tags used to label a pending/received response -- NOT bytes on the wire.
# Whichever REQUEST_* command was last sent determines which of these the
# next incoming bytes are tagged with (see ResponseCollector / SerialWorker.send).
PURPOSE_CIPHERTEXT = "ciphertext"
PURPOSE_SBOX = "sbox"
PURPOSE_KEYEXP = "keyexp"

PURPOSE_NAMES = {
    PURPOSE_CIPHERTEXT: "CIPHERTEXT",
    PURPOSE_SBOX: "SBOX",
    PURPOSE_KEYEXP: "KEYEXP",
}

# Fixed response lengths (bytes) for the two purposes whose size never
# changes. PURPOSE_KEYEXP is NOT here because its length depends on the
# currently selected AES version -- see AES_VERSIONS and
# SerialWorker.keyexp_len below.
PURPOSE_PAYLOAD_LEN = {
    PURPOSE_CIPHERTEXT: 16,
    PURPOSE_SBOX: 256,
}

# AES version -> (select command byte, key length in bytes, expanded-key
# (round keys) length in bytes: 11/13/15 round keys * 16 bytes each)
AES_VERSIONS = {
    "AES-128": (CMD_SELECT_AES_128, 16, 176),
    "AES-192": (CMD_SELECT_AES_192, 24, 208),
    "AES-256": (CMD_SELECT_AES_256, 32, 240),
}

# Chaotic maps implemented in the FPGA. Edit this list (name + order) to
# match what is actually instantiated in your design -- the index in this
# list is added to CMD_SBOX_BLOCK_BASE / CMD_KEYEXP_BLOCK_BASE to form the
# command byte sent on the wire.
CHAOTIC_BLOCKS = [
    "Standar AES",
    "Logistic Map",
    "Lorenz System",
    "Rossler System",
]

BAUD_RATES = [9600, 19200, 38400, 57600, 115200, 230400, 460800, 921600]


def cmd_name(cmd: int) -> str:
    """Human-readable name for a PC->FPGA command byte, for logging."""
    if cmd == CMD_SELECT_AES_128:
        return "SELECT_AES_128"
    if cmd == CMD_SELECT_AES_192:
        return "SELECT_AES_192"
    if cmd == CMD_SELECT_AES_256:
        return "SELECT_AES_256"
    if CMD_SBOX_BLOCK_BASE <= cmd < CMD_SBOX_BLOCK_BASE + len(CHAOTIC_BLOCKS):
        idx = cmd - CMD_SBOX_BLOCK_BASE
        return f"SELECT_SBOX_BLOCK[{CHAOTIC_BLOCKS[idx]}]"
    if CMD_KEYEXP_BLOCK_BASE <= cmd < CMD_KEYEXP_BLOCK_BASE + len(CHAOTIC_BLOCKS):
        idx = cmd - CMD_KEYEXP_BLOCK_BASE
        return f"SELECT_KEYEXP_BLOCK[{CHAOTIC_BLOCKS[idx]}]"
   # if cmd == CMD_LOAD_KEY:
    #    return "LOAD_KEY"
    if cmd == CMD_LOAD_PLAINTEXT:
        return "LOAD_PLAINTEXT"
   # if cmd == CMD_START_ENCRYPT:
    #    return "START_ENCRYPT"
    if cmd == CMD_REQUEST_CIPHERTEXT:
        return "REQUEST_CIPHERTEXT"
    if cmd == CMD_REQUEST_SBOX:
        return "REQUEST_SBOX"
    if cmd == CMD_REQUEST_KEY_EXPANSION:
        return "REQUEST_KEY_EXPANSION"
    return f"0x{cmd:02X}"


# =========================================================================
# Wire encoding: just CMD byte + optional payload, no framing at all
# =========================================================================

def build_frame(cmd: int, payload: bytes = b"") -> bytes:
    return bytes([cmd]) + payload


class ResponseCollector:
    """
    Collects incoming serial bytes with NO command header, NO framing, and
    NO ACK/NACK -- the FPGA just streams raw result bytes back. The host
    only ever reads right after IT sent a REQUEST_* command, so it already
    knows how many bytes to expect and what they mean; call expect(purpose,
    length) at the moment a request is sent (SerialWorker.send() does this
    automatically), then feed() incoming bytes and it emits (purpose,
    payload) once exactly `length` bytes have arrived.

    Bytes that arrive with nothing currently expected (self.purpose is
    None) are reported back tagged "unexpected" instead of being
    misinterpreted -- that should only happen if the FPGA sends something
    unsolicited, or if bytes were dropped/garbled on the wire.
    """

    def __init__(self):
        self.purpose = None
        self.expected_len = 0
        self.buffer = bytearray()

    def expect(self, purpose: str, length: int):
        """Call this right when a REQUEST_* command is sent, so the next
        `length` incoming bytes get tagged as `purpose` once complete."""
        self.purpose = purpose
        self.expected_len = length
        self.buffer = bytearray()

    def feed(self, data: bytes):
        results = []
        i, n = 0, len(data)
        while i < n:
            if self.purpose is None:
                # Nothing was requested -- these bytes are unaccounted for.
                results.append(("unexpected", bytes(data[i:])))
                break
            remaining = self.expected_len - len(self.buffer)
            take = min(remaining, n - i)
            self.buffer.extend(data[i:i + take])
            i += take
            if len(self.buffer) >= self.expected_len:
                results.append((self.purpose, bytes(self.buffer)))
                self.purpose = None
                self.buffer = bytearray()
        return results


# =========================================================================
# Serial worker thread
# =========================================================================

class SerialWorker:
    """Owns the pyserial connection and a background reader thread."""

    def __init__(self, on_frame, on_log):
        self.ser = None
        self.thread = None
        self.stop_flag = threading.Event()
        self.on_frame = on_frame   # callback(purpose, payload) -- called from bg thread
        self.on_log = on_log       # callback(str) -- called from bg thread
        self.collector = ResponseCollector()
        self.keyexp_len = AES_VERSIONS["AES-128"][2]  # kept in sync by the GUI

    @property
    def is_open(self):
        return self.ser is not None and self.ser.is_open

    def connect(self, port, baud):
        self.ser = serial.Serial(port, baudrate=baud, bytesize=8,
                                  parity="N", stopbits=1, timeout=0.1)
        self.stop_flag.clear()
        self.thread = threading.Thread(target=self._read_loop, daemon=True)
        self.thread.start()

    def disconnect(self):
        self.stop_flag.set()
        if self.thread:
            self.thread.join(timeout=1.0)
        if self.ser and self.ser.is_open:
            self.ser.close()
        self.ser = None

    def send(self, cmd: int, payload: bytes = b""):
        if not self.is_open:
            raise RuntimeError("Serial port is not open")
        frame = build_frame(cmd, payload)
        self.ser.write(frame)
        self.on_log(f"TX  {cmd_name(cmd):<28} {frame.hex(' ')}")
        # Sending a REQUEST_* command means we now know exactly what the
        # next bytes off the wire will mean -- tell the collector.
        if cmd == CMD_REQUEST_CIPHERTEXT:
            self.collector.expect(PURPOSE_CIPHERTEXT, PURPOSE_PAYLOAD_LEN[PURPOSE_CIPHERTEXT])
        elif cmd == CMD_REQUEST_SBOX:
            self.collector.expect(PURPOSE_SBOX, PURPOSE_PAYLOAD_LEN[PURPOSE_SBOX])
        elif cmd == CMD_REQUEST_KEY_EXPANSION:
            self.collector.expect(PURPOSE_KEYEXP, self.keyexp_len)

    def _read_loop(self):
        while not self.stop_flag.is_set():
            try:
                data = self.ser.read(256)
            except Exception as exc:
                self.on_log(f"!! Serial read error: {exc}")
                break
            if data:
                for purpose, payload in self.collector.feed(data):
                    if purpose == "unexpected":
                        self.on_log(f"!! RX unexpected bytes (nothing was requested): {payload.hex(' ')}")
                        continue
                    name = PURPOSE_NAMES.get(purpose, purpose)
                    preview = payload.hex(' ') if len(payload) <= 32 else \
                        payload[:32].hex(' ') + f" ... ({len(payload)} bytes total)"
                    self.on_log(f"RX  {name:<28} {preview}")
                    self.on_frame(purpose, payload)


# =========================================================================
# GUI
# =========================================================================

class ChaosAESApp(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Chaotic-AES FPGA Controller")
        self.geometry("760x900")
        self.minsize(700, 760)

        self.rx_queue = queue.Queue()
        self.worker = SerialWorker(on_frame=self._on_frame_bg, on_log=self._on_log_bg)

        self._build_widgets()
        self._refresh_ports()
        self._sync_keyexp_len()
        self.after(100, self._poll_queue)
        self.protocol("WM_DELETE_WINDOW", self._on_close)

    # ---------------------------------------------------------- layout --
    def _build_widgets(self):
        pad = dict(padx=8, pady=6)

        # ---- Connection frame ----
        conn = ttk.LabelFrame(self, text="Serial Connection (RS-232)")
        conn.pack(fill="x", **pad)

        ttk.Label(conn, text="Port:").grid(row=0, column=0, sticky="w", padx=4, pady=4)
        self.port_cb = ttk.Combobox(conn, width=18, state="readonly")
        self.port_cb.grid(row=0, column=1, padx=4, pady=4)

        ttk.Button(conn, text="Refresh", command=self._refresh_ports).grid(
            row=0, column=2, padx=4, pady=4)

        ttk.Label(conn, text="Baud:").grid(row=0, column=3, sticky="w", padx=4, pady=4)
        self.baud_cb = ttk.Combobox(conn, width=10, state="readonly",
                                     values=BAUD_RATES)
        self.baud_cb.set(115200)
        self.baud_cb.grid(row=0, column=4, padx=4, pady=4)

        self.connect_btn = ttk.Button(conn, text="Connect", command=self._toggle_connect)
        self.connect_btn.grid(row=0, column=5, padx=8, pady=4)

        self.status_lbl = ttk.Label(conn, text="Disconnected", foreground="red")
        self.status_lbl.grid(row=0, column=6, padx=8, pady=4)

        # ---- Key frame ----
        # keyf = ttk.LabelFrame(self, text="Key")
        # keyf.pack(fill="x", **pad)

        # self.key_hint_lbl = ttk.Label(cfg, text="")
        # self.key_hint_lbl.grid(row=0, column=0, columnspan=3, sticky="w", padx=4)

        # ttk.Label(cfg, text="Key (hex):").grid(row=1, column=0, sticky="w", padx=4, pady=4)
        # self.key_entry = ttk.Entry(keyf, width=70, font=("Consolas", 10))
        # self.key_entry.grid(row=1, column=1, padx=4, pady=4, sticky="we")

        # ttk.Button(cfg, text="Random", command=self._random_key).grid(
        #     row=1, column=2, padx=4, pady=4)
        # ttk.Button(cfg, text="Send Key", command=self._send_key).grid(
        #     row=1, column=3, padx=4, pady=4)

        # keyf.columnconfigure(1, weight=1)

        
        
        # ---- AES configuration frame ----
        cfg = ttk.LabelFrame(self, text="Configuration")
        cfg.pack(fill="x", **pad)

        ttk.Label(cfg, text="AES version:").grid(row=0, column=0, sticky="w", padx=4, pady=4)
       
        self.aes_cb = ttk.Combobox(cfg, width=14, state="readonly",
                                    values=list(AES_VERSIONS.keys()))
        self.aes_cb.current(0)
        self.aes_cb.bind("<<ComboboxSelected>>", lambda e: self._on_aes_version_changed())
        self.aes_cb.grid(row=0, column=0, padx=80, pady=4, sticky='w')

        
        
        
        self.key_hint_lbl = ttk.Label(cfg, text="")
        self.key_hint_lbl.grid(row=1, column=0, columnspan=3, sticky="w", padx=4)

        ttk.Label(cfg, text="Key (hex):").grid(row=2, column=0, sticky="w", padx=4, pady=4)
        
        self.key_entry = ttk.Entry(cfg, width=70, font=("Consolas", 10))
        self.key_entry.grid(row=2, column=0, padx=80, pady=4, sticky="w")

        ttk.Button(cfg, text="Random", command=self._random_key).grid(
            row=2, column=0, padx=600, pady=4, sticky='w')
        ttk.Button(cfg, text="Send Key", command=self._send_key).grid(
            row=2, column=0, padx=680, pady=4,)





        ttk.Label(cfg, text="S-box chaotic block:").grid(row=3, column=0, sticky="w", padx=4, pady=4)
        self.sbox_block_cb = ttk.Combobox(cfg, width=18, state="readonly",
                                           values=CHAOTIC_BLOCKS)
        self.sbox_block_cb.current(0)
        self.sbox_block_cb.grid(row=3, column=0, padx=200, pady=4, sticky='w')

        ttk.Label(cfg, text="Key-expansion chaotic block:").grid(
            row=4, column=0, sticky="w", padx=4, pady=4)
        self.keyexp_block_cb = ttk.Combobox(cfg, width=18, state="readonly",
                                             values=CHAOTIC_BLOCKS)
        self.keyexp_block_cb.current(0)
        self.keyexp_block_cb.grid(row=4, column=0, padx=200, pady=4, sticky='w')

        self.apply_cfg_btn = ttk.Button(cfg, text="Apply S-box Configuration to FPGA",
                                         command=self._send_sbox_configuration)
        self.apply_cfg_btn.grid(row=3, column=0, padx=370, pady=4, sticky='w')

        self.apply_cfg_btn = ttk.Button(cfg, text="Apply Key Configuration to FPGA",
                                         command=self._send_key_configuration)
        self.apply_cfg_btn.grid(row=4, column=0, padx=370, pady=4, sticky='w')


       # cfg.columnconfigure(1, weight=1)

        # # ---- Key frame ----
        # keyf = ttk.LabelFrame(self, text="Key")
        # keyf.pack(fill="x", **pad)

        # self.key_hint_lbl = ttk.Label(keyf, text="")
        # self.key_hint_lbl.grid(row=0, column=0, columnspan=3, sticky="w", padx=4)

        # ttk.Label(keyf, text="Key (hex):").grid(row=1, column=0, sticky="w", padx=4, pady=4)
        # self.key_entry = ttk.Entry(keyf, width=70, font=("Consolas", 10))
        # self.key_entry.grid(row=1, column=1, padx=4, pady=4, sticky="we")

        # ttk.Button(keyf, text="Random", command=self._random_key).grid(
        #     row=1, column=2, padx=4, pady=4)
        # ttk.Button(keyf, text="Send Key", command=self._send_key).grid(
        #     row=1, column=3, padx=4, pady=4)

        # keyf.columnconfigure(1, weight=1)

        # ---- Plaintext / ciphertext frame ----
        pcf = ttk.LabelFrame(self, text="Plaintext / Ciphertext")
        pcf.pack(fill="x", **pad)

        ttk.Label(pcf, text="Plaintext (32 hex chars / 16 bytes):").grid(
            row=0, column=0, sticky="w", padx=4, pady=4)
        self.pt_entry = ttk.Entry(pcf, width=70, font=("Consolas", 10))
        self.pt_entry.grid(row=0, column=1, padx=4, pady=4, sticky="we")

        ttk.Button(pcf, text="Send Plaintext && Encrypt",
                   command=self._send_plaintext_and_encrypt).grid(
            row=0, column=2, padx=4, pady=4, sticky="w")

        ttk.Label(pcf, text="Ciphertext (hex):").grid(
            row=1, column=0, sticky="w", padx=4, pady=4)
        self.ct_entry = ttk.Entry(pcf, width=70, font=("Consolas", 10), state="readonly")
        self.ct_entry.grid(row=1, column=1, padx=4, pady=4, sticky="we")

        ttk.Button(pcf, text="Request Ciphertext", command=self._request_ciphertext).grid(
                    row=1, column=2, padx=4, pady=4, sticky="w")

        ttk.Button(pcf, text="Copy", command=self._copy_ciphertext).grid(
            row=1, column=2, padx=120, pady=4, sticky="w")

        pcf.columnconfigure(1, weight=1)

        # ---- Generated S-box / key expansion (diagnostics) frame ----
        genf = ttk.LabelFrame(self, text="Generated S-box / Key Expansion (Diagnostics)")
        genf.pack(fill="x", **pad)

        ttk.Button(genf, text="Request S-box (256 bytes)",
                   command=self._request_sbox).grid(row=0, column=0, padx=4, pady=4, sticky="w")
        ttk.Button(genf, text="Copy S-box", command=self._copy_sbox).grid(
            row=0, column=1, padx=4, pady=4, sticky="w")

        self.sbox_text = tk.Text(genf, height=4, width=80, font=("Consolas", 9), wrap="word")
        self.sbox_text.grid(row=1, column=0, columnspan=2, padx=4, pady=(0, 8), sticky="we")

        self.keyexp_btn = ttk.Button(genf, text="Request Key Expansion (176 bytes)",
                                      command=self._request_key_expansion)
        self.keyexp_btn.grid(row=2, column=0, padx=4, pady=4, sticky="w")
        ttk.Button(genf, text="Copy Key Expansion", command=self._copy_keyexp).grid(
            row=2, column=1, padx=4, pady=4, sticky="w")

        self.keyexp_text = tk.Text(genf, height=4, width=80, font=("Consolas", 9), wrap="word")
        self.keyexp_text.grid(row=3, column=0, columnspan=2, padx=4, pady=(0, 8), sticky="we")

        genf.columnconfigure(1, weight=1)

        # ---- Log frame ----
        logf = ttk.LabelFrame(self, text="Communication Log")
        logf.pack(fill="both", expand=True, **pad)

        self.log_text = tk.Text(logf, height=14, font=("Consolas", 9), state="disabled",
                                 wrap="none", bg="#111", fg="#0f0")
        self.log_text.pack(side="left", fill="both", expand=True)
        scroll = ttk.Scrollbar(logf, command=self.log_text.yview)
        scroll.pack(side="right", fill="y")
        self.log_text.configure(yscrollcommand=scroll.set)

        ttk.Button(self, text="Clear Log", command=self._clear_log).pack(anchor="e", padx=8, pady=(0, 8))

        self._update_key_len_hint()

    # ------------------------------------------------------- ports/conn --
    def _refresh_ports(self):
        ports = [p.device for p in list_ports.comports()]
        self.port_cb["values"] = ports
        if ports and not self.port_cb.get():
            self.port_cb.current(0)

    def _toggle_connect(self):
        if self.worker.is_open:
            self.worker.disconnect()
            self.connect_btn.configure(text="Connect")
            self.status_lbl.configure(text="Disconnected", foreground="red")
            self._log("-- Disconnected --")
        else:
            port = self.port_cb.get()
            baud = self.baud_cb.get()
            if not port:
                messagebox.showwarning("No port selected", "Please select a serial port first.")
                return
            try:
                self.worker.connect(port, int(baud))
            except Exception as exc:
                messagebox.showerror("Connection failed", str(exc))
                return
            self.connect_btn.configure(text="Disconnect")
            self.status_lbl.configure(text=f"Connected: {port} @ {baud} baud", foreground="green")
            self._log(f"-- Connected to {port} @ {baud} baud --")

    def _on_close(self):
        if self.worker.is_open:
            self.worker.disconnect()
        self.destroy()

    # --------------------------------------------------------- helpers --
    def _on_aes_version_changed(self):
        self._update_key_len_hint()
        self._sync_keyexp_len()

    def _sync_keyexp_len(self):
        """Keep the worker's expected key-expansion response length and the
        button label in sync with whichever AES version is selected."""
        _, _, keyexp_len = AES_VERSIONS[self.aes_cb.get()]
        self.worker.keyexp_len = keyexp_len
        self.keyexp_btn.configure(text=f"Request Key Expansion ({keyexp_len} bytes)")

    def _update_key_len_hint(self):
        version = self.aes_cb.get()
        _, key_len, _ = AES_VERSIONS[version]
        self.key_hint_lbl.configure(
            text=f"{version} requires a {key_len}-byte key ({key_len * 2} hex characters).")

    def _require_connection(self):
        if not self.worker.is_open:
            messagebox.showwarning("Not connected", "Connect to the FPGA over serial first.")
            return False
        return True

    @staticmethod
    def _parse_hex(text, expected_len=None, field_name="value"):
        text = text.strip().replace(" ", "").replace("0x", "").replace("0X", "")
        try:
            data = bytes.fromhex(text)
        except ValueError:
            raise ValueError(f"{field_name} must be valid hex characters only.")
        if expected_len is not None and len(data) != expected_len:
            raise ValueError(
                f"{field_name} must be exactly {expected_len} bytes "
                f"({expected_len * 2} hex chars); got {len(data)} bytes.")
        return data

    def _random_key(self):
        _, key_len, _ = AES_VERSIONS[self.aes_cb.get()]
        self.key_entry.delete(0, tk.END)
        self.key_entry.insert(0, os.urandom(key_len).hex())

    def _copy_ciphertext(self):
        self.clipboard_clear()
        self.clipboard_append(self.ct_entry.get())

    def _copy_sbox(self):
        self.clipboard_clear()
        self.clipboard_append(self.sbox_text.get("1.0", tk.END).strip())

    def _copy_keyexp(self):
        self.clipboard_clear()
        self.clipboard_append(self.keyexp_text.get("1.0", tk.END).strip())

    # --------------------------------------------------------- actions --
    def _send_sbox_configuration(self):
        if not self._require_connection():
            return
        try:
           # aes_cmd, _, _ = AES_VERSIONS[self.aes_cb.get()]
            sbox_idx = self.sbox_block_cb.current()
           # keyexp_idx = self.keyexp_block_cb.current()
#            self.worker.send(aes_cmd)
            self.worker.send(CMD_SBOX_BLOCK_BASE + sbox_idx)
           # self.worker.send(CMD_KEYEXP_BLOCK_BASE + keyexp_idx)
        except Exception as exc:
            messagebox.showerror("Send failed", str(exc))


    def _send_key_configuration(self):
        if not self._require_connection():
            return
        try:
           # aes_cmd, _, _ = AES_VERSIONS[self.aes_cb.get()]
           # sbox_idx = self.sbox_block_cb.current()
            keyexp_idx = self.keyexp_block_cb.current()
#            self.worker.send(aes_cmd)
           # self.worker.send(CMD_SBOX_BLOCK_BASE + sbox_idx)
            self.worker.send(CMD_KEYEXP_BLOCK_BASE + keyexp_idx)
        except Exception as exc:
            messagebox.showerror("Send failed", str(exc))


    def _send_key(self):
        if not self._require_connection():
            return
        try:
            _, key_len, _ = AES_VERSIONS[self.aes_cb.get()]
            key_bytes = self._parse_hex(self.key_entry.get(), key_len, "Key")
           # self.worker.send(CMD_LOAD_KEY, key_bytes)
           #------------------------------------------------
            key_command, _, _ = AES_VERSIONS[self.aes_cb.get()]
            self.worker.send(key_command, key_bytes)            
           #------------------------------------------------

        except Exception as exc:
            messagebox.showerror("Invalid key", str(exc))

    def _send_plaintext_and_encrypt(self):
        if not self._require_connection():
            return
        try:
            pt_bytes = self._parse_hex(self.pt_entry.get(), 16, "Plaintext")
            self.worker.send(CMD_LOAD_PLAINTEXT, pt_bytes)
           # self.worker.send(CMD_START_ENCRYPT)    -- empieza a encriptar cuando termina de recibir datos, no hace falta un start_encrypt
        except Exception as exc:
            messagebox.showerror("Invalid plaintext", str(exc))

    def _request_ciphertext(self):
        if not self._require_connection():
            return
        self.worker.send(CMD_REQUEST_CIPHERTEXT)

    def _request_sbox(self):
        if not self._require_connection():
            return
        self.worker.send(CMD_REQUEST_SBOX)

    def _request_key_expansion(self):
        if not self._require_connection():
            return
        self.worker.send(CMD_REQUEST_KEY_EXPANSION)

    # ------------------------------------------------- bg thread hooks --
    def _on_log_bg(self, text):
        self.rx_queue.put(("log", text))

    def _on_frame_bg(self, purpose, payload):
        self.rx_queue.put(("frame", (purpose, payload)))

    def _poll_queue(self):
        try:
            while True:
                kind, data = self.rx_queue.get_nowait()
                if kind == "log":
                    self._log(data)
                elif kind == "frame":
                    purpose, payload = data
                    self._handle_frame(purpose, payload)
        except queue.Empty:
            pass
        self.after(100, self._poll_queue)

    def _handle_frame(self, purpose, payload):
        if purpose == PURPOSE_CIPHERTEXT:
            self.ct_entry.configure(state="normal")
            self.ct_entry.delete(0, tk.END)
            self.ct_entry.insert(0, payload.hex())
            self.ct_entry.configure(state="readonly")
        elif purpose == PURPOSE_SBOX:
            self._set_text(self.sbox_text, payload.hex(" "))
        elif purpose == PURPOSE_KEYEXP:
            self._set_text(self.keyexp_text, payload.hex(" "))

    @staticmethod
    def _set_text(widget, text):
        widget.delete("1.0", tk.END)
        widget.insert("1.0", text)

    def _log(self, text):
        ts = time.strftime("%H:%M:%S")
        self.log_text.configure(state="normal")
        self.log_text.insert(tk.END, f"[{ts}] {text}\n")
        self.log_text.see(tk.END)
        self.log_text.configure(state="disabled")

    def _clear_log(self):
        self.log_text.configure(state="normal")
        self.log_text.delete("1.0", tk.END)
        self.log_text.configure(state="disabled")


if __name__ == "__main__":
    app = ChaosAESApp()
    app.mainloop()