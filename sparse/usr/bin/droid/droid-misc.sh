#!/bin/sh

# Waydroid
ln -sf /dev/binderfs/* /dev/

# D2TW
echo 1 > /proc/driver/dclick
# Single tap to wake
echo 1 > /sys/devices/platform/soc/990000.i2c/i2c-1/1-0038/fts_aod_ctrl_mode
echo 1 > /sys/devices/platform/soc/990000.i2c/i2c-1/1-0038/fts_gesture_mode

# Power vibra
/sbin/modprobe aw8697

# Video recording
setprop debug.stagefright.c2inputsurface -1

# sailfish-fpd-community
touch /odm/lib64/android.hardware.biometrics.fingerprint@2.1.so
mount -o ro,bind /apex/com.android.vndk.v30/lib64/android.hardware.biometrics.fingerprint@2.1.so /odm/lib64/android.hardware.biometrics.fingerprint@2.1.so
