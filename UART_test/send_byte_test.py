import serial
import time

# Open the serial port
ser = serial.Serial(
    port='COM3',      # Change this to your port (e.g. '/dev/ttyUSB0' on Linux)
    baudrate=115200,
    timeout=1
)

time.sleep(2)  # Give the port time to initialize (common on USB-serial adapters)

# Send a single byte (for example: 0x55)
ser.write(bytes([0xF8]))

print("Byte sent!")

ser.close()
