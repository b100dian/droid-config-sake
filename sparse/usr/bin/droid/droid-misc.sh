#!/bin/sh

# Waydroid
ln -sf /dev/binderfs/* /dev/

# D2TW
echo 1 > /proc/driver/dclick

# Power vibra
/sbin/modprobe aw8697
echo 1 > /sys/class/leds/vibrator/activate_mode

# Video recording
setprop debug.stagefright.c2inputsurface -1

# sailfish-fpd-community
touch /odm/lib64/android.hardware.biometrics.fingerprint@2.1.so
mount -o ro,bind /apex/com.android.vndk.v30/lib64/android.hardware.biometrics.fingerprint@2.1.so /odm/lib64/android.hardware.biometrics.fingerprint@2.1.so
