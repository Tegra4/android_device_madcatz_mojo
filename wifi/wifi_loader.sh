#!/system/bin/sh

# Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.

region=$(cat /data/misc/wifi/conf/wifi_region.conf)

	#check if symlinks are available; if available, do not create symlinks
	#this check is needed when data partition is remounted after encryption
	if [ -L /system/vendor/firmware/bcm43241/fw_bcmdhd_apsta.bin ]; then
		/system/bin/log -t "wifiloader" -p i  "Firmware is symlinked"
else
		/system/bin/log -t "wifiloader" -p i  "Symlinking firmware"
		/system/bin/ln -s /system/vendor/firmware/bcm43241/fw_bcmdhd.bin /system/vendor/firmware/bcm43241/fw_bcmdhd_apsta.bin
        fi

        # region specific nvram
	if [ $region = "JP01" ]; then
		/system/bin/log -t "wifiloader" -p i  "Japan region"
		/system/bin/ln -s /system/etc/nvram_JP01_43241.txt /system/etc/nvram_43241.txt
	elif [ $region = "US39" ]; then
		/system/bin/log -t "wifiloader" -p i  "US region"
		/system/bin/ln -s /system/etc/nvram_US39_43241.txt /system/etc/nvram_43241.txt
	elif [ $region = "XV01" ]; then
		/system/bin/log -t "wifiloader" -p i  "Global region"
		/system/bin/ln -s /system/etc/nvram_XV01_43241.txt /system/etc/nvram_43241.txt
	else
		/system/bin/log -t "wifiloader" -p i  "Default global region"
		/system/bin/ln -s /system/etc/nvram_XV01_43241.txt /system/etc/nvram_43241.txt
	fi
