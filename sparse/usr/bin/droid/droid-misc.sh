#!/bin/sh

# Waydroid
ln -sf /dev/binderfs/* /dev/

# D2TW
echo 1 > /proc/driver/dclick

# Power vibra
/sbin/modprobe aw8697
echo 1 > /sys/class/leds/vibrator/activate_mode

