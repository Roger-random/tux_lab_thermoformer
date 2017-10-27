"""
This is a stub of the Raspberry Pi default Python GPIO library, just
barely enough to test this project on a non-Pi computer.

Reference the original at
http://abyz.me.uk/rpi/pigpio/python.html
https://github.com/joan2937/pigpio/blob/master/pigpio.py
"""

# GPIO edges

EITHER_EDGE  = 2

# GPIO modes

INPUT  = 0
OUTPUT = 1

def pi():
  return pigpio_stub()

class pigpio_stub(object):
  def __init__(self):
    super().__init__()
    print("pigpio_stub initialize")
    self.connected = True

  def callback(self, user_gpio, edge, func):
    print("Callback requested on pin ", str(user_gpio))

  def read(self, user_gpio):
    print("Attempted to read pin ", str(user_gpio))
    return 0;

  def set_mode(self, gpio, mode):
    print("Setting mode of pin ", str(gpio))

  def stop(self):
    print("Stop was called")

  def write(self, gpio, level):
    print("Writing to pin ", str(gpio))
