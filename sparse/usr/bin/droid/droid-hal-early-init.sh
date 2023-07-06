#!/bin/sh

# This should prevent `echo 1 > /dev/ipa` to crash the kernel
echo -n "/vendor/firmware" > /sys/module/firmware_class/parameters/path

# Enable WLAN recovery
echo 1 > /sys/devices/platform/soc/b0000000.qcom,cnss-qca6490/recovery
# Enable WLAN cold boot calibration
# [Disabled] echo 1 > /sys/devices/platform/soc/b0000000.qcom,cnss-qca6490/fs_ready
# We let android services do CBC on post-fs-data
# Then they'll find this driver right where expected
mount -o bind /etc/WCNSS_qcom_cfg.ini /vendor/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini
mount -o bind /lib/modules/$(uname -r)/qca_cld3_wlan.ko /vendor/lib/modules/qca_cld3_wlan.ko

# Allows qseecomd to start
ln -s /dev/bsg/ufs-bsg0 /dev/ufs-bsg
# Still qseecomd, fingerprint
ln -s /dev/bsg/0\:0\:0\:49476  /dev/0\:0\:0\:49476

# Allows libui_compat_layer to work
mount -o bind /dev/null /vendor/lib64/hw/gralloc.default.so
