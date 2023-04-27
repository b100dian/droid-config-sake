#!/bin/sh

# This should prevent `echo 1 > /dev/ipa` to crash the kernel
echo -n "/vendor/firmware" > /sys/module/firmware_class/parameters/path

# Enable WLAN cold boot calibration
echo 1 > /sys/devices/platform/soc/b0000000.qcom,cnss-qca6490/fs_ready

# Allows qseecomd to start
ln -s /dev/bsg/ufs-bsg0 /dev/ufs-bsg

# Allows libui_compat_layer to work
mount -o bind /dev/null /vendor/lib64/hw/gralloc.default.so

# D2TW
echo 1 > /sys/devices/platform/soc/990000.i2c/i2c-1/1-0038/fts_aod_ctrl_mode
echo 1 > /sys/devices/platform/soc/990000.i2c/i2c-1/1-0038/fts_gesture_mode
