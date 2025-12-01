import serial

def main():
    # Open serial port
    ser = serial.Serial(
        port='COM3',        # Change to your port (e.g. '/dev/ttyUSB0' on Linux)
        baudrate=115200,
        timeout=1           # seconds
    )

    print("Listening on", ser.port)

    try:
        while True:
            byte = ser.read()   # Read exactly 1 byte
            if byte:
                # Print raw byte in hex format
                print(f"Received: {byte.hex()}")
    except KeyboardInterrupt:
        print("\nStopping...")
    finally:
        ser.close()

if __name__ == "__main__":
    main()
