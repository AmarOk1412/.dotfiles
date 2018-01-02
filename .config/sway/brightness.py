import sys

if len(sys.argv) == 1:
    sys.exit('not enough args')

brightness_file='/sys/class/backlight/intel_backlight/brightness'
MAX_BRIGHTNESS=1500
MIN_BRIGHTNESS=0

current_value=0
try:
    with open(brightness_file, 'r') as f:
        current_value = int(f.read())
except:
    sys.exit('incorrect read!')

try:
    wanted_value = current_value + int(sys.argv[-1])
    if MIN_BRIGHTNESS <= wanted_value <= MAX_BRIGHTNESS:
        with open(brightness_file, 'w+') as f:
            f.write(str(wanted_value))
except:
    sys.exit('incorrect write!')
