#!/bin/sh

# This should prevent `echo 1 > /dev/ipa` to crash the kernel
echo -n "/vendor/firmware" > /sys/module/firmware_class/parameters/path

# Enable WLAN cold boot calibration
echo 1 > /sys/devices/platform/soc/b0000000.qcom,cnss-qca6490/fs_ready
