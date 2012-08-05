# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, build/target/product/languages_full.mk)
$(call inherit-product, build/target/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Add device package overlay
  DEVICE_PACKAGE_OVERLAYS += device/samsung/totoro/overlay

# Broadcom FM radio
#  $(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

PRODUCT_PACKAGES += \
    setup_fs \
    SamsungServiceMode \
    bdaddr_read \
    toggleshutter \
    libui \
    alsa.default \
    acoustics.default \
    patchlcs \
    overlay.default \
    libhardware \
    libhardware_legacy \
    rzscontrol \
    libOmxCore \
    e2fsck \
    screencap

ifeq ($(TARGET_PREBUILT_KERNEL),)
      LOCAL_KERNEL := device/samsung/totoro/kernel
else
      LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# proprietary side of the device
$(call inherit-product-if-exists, vendor/samsung/totoro/totoro-vendor.mk)


# Add LDPI assets, in addition to MDPI
  PRODUCT_LOCALES += ldpi mdpi

# Extra overlay for LDPI
  PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/ldpi

# Kernel debug file
PRODUCT_COPY_FILES += \
	device/samsung/totoro/prebuilt/xbin/klogtail:system/xbin/klogtail

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/totoro/ueventd.gt-s5360.rc:root/ueventd.gt-s5360.rc \
    device/samsung/totoro/prebuilt/fsr.ko:root/fsr.ko \
    device/samsung/totoro/prebuilt/modules/dhd.ko:root/lib/modules/bcm4330.ko \
    device/samsung/totoro/prebuilt/fsr_stl.ko:root/fsr_stl.ko \
    device/samsung/totoro/prebuilt/rfs_fat.ko:root/rfs_fat.ko \
    device/samsung/totoro/prebuilt/rfs_glue.ko:root/rfs_glue.ko \
    device/samsung/totoro/prebuilt/j4fs.ko:root/j4fs.ko \
    device/samsung/totoro/prebuilt/fota_logo.png:root/sbin/fota_logo.png \
    device/samsung/totoro/prebuilt/ua_launcher:root/sbin/ua_launcher \
    device/samsung/totoro/prebuilt/sec_param.ko:root/sec_param.ko \
    device/samsung/totoro/fota.rc:root/fota.rc \
    device/samsung/totoro/init.rc:root/init.rc \
    device/samsung/totoro/init.charge.rc:root/init.charge.rc \
    device/samsung/totoro/init.gt-s5360.rc:root/init.gt-s5360.rc

PRODUCT_COPY_FILES += \
    device/samsung/totoro/egl.cfg:system/lib/egl.cfg \
    device/samsung/totoro/dhcpcd.conf:system/etc/dhcpcd.conf \
    device/samsung/totoro/vold.fstab:system/etc/vold.fstab \
    device/samsung/totoro/dbus.conf:system/etc/dbus.conf \
    device/samsung/totoro/recovery.fstab:recovery/root/etc/recovery.fstab 

# Keyboard maps
PRODUCT_COPY_FILES += \
	device/samsung/totoro/prebuilt/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
	device/samsung/totoro/prebuilt/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
	device/samsung/totoro/prebuilt/keychars/sec_key.kcm.bin:system/usr/keychars/sec_key.kcm.bin \
	device/samsung/totoro/prebuilt/icu/icudt44l.dat:system/usr/icu/icudt44l.dat \
	device/samsung/totoro/prebuilt/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/samsung/totoro/prebuilt/keylayout/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
	device/samsung/totoro/prebuilt/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	device/samsung/totoro/prebuilt/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/totoro/prebuilt/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
	device/samsung/totoro/prebuilt/keylayout/sec_keypad.kl:system/usr/keylayout/sec_keypad.kl 

# gps
PRODUCT_COPY_FILES += \
	device/samsung/totoro/prebuilt/gps/glconfig.xml:system/etc/gps/glconfig.xml \
	device/samsung/totoro/prebuilt/gps/glconfig2075.xml:system/etc/gps/glconfig2075.xml \
	device/samsung/totoro/prebuilt/gps/glconfig4751.xml:system/etc/gps/glconfig4751.xml

# wifi
PRODUCT_COPY_FILES += \
	device/samsung/totoro/wifi/bcm4330_aps.bin:system/etc/wifi/bcm4330_aps.bin \
	device/samsung/totoro/wifi/bcm4330_mfg.bin:system/etc/wifi/bcm4330_mfg.bin \
	device/samsung/totoro/wifi/bcm4330_sta.bin:system/etc/wifi/bcm4330_sta.bin \
	device/samsung/totoro/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
	device/samsung/totoro/wifi/nvram.txt:system/etc/wifi/nvram.txt \
	device/samsung/totoro/wifi/wifi.conf:system/etc/wifi/wifi.conf \
	device/samsung/totoro/wifi/iperf:system/etc/wifi/iperf \
	device/samsung/totoro/wifi/RC_248_WPA.bin:system/etc/wifi/RC_248_WPA.bin \
	device/samsung/totoro/prebuilt/btld:system/bin/btld \
	device/samsung/totoro/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf 

# others
PRODUCT_COPY_FILES += \
    device/samsung/totoro/prebuilt/runSysCmd:system/bin/runSysCmd \
    device/samsung/totoro/prebuilt/usb_portd:system/bin/usb_portd \
    device/samsung/totoro/prebuilt/etc/adb.sh:system/etc/adb.sh \
    device/samsung/totoro/prebuilt/etc/apanic_rename.sh:system/etc/apanic_rename.sh \
    device/samsung/totoro/prebuilt/etc/atmode.sh:system/etc/atmode.sh \
    device/samsung/totoro/prebuilt/etc/bcmtestl.sh:system/etc/bcmtestl.sh \
    device/samsung/totoro/prebuilt/etc/logcfg.sh:system/etc/logcfg.sh \
    device/samsung/totoro/prebuilt/etc/modem.sh:system/etc/modem.sh \
    device/samsung/totoro/prebuilt/etc/rndis.sh:system/etc/rndis.sh \
    device/samsung/totoro/prebuilt/etc/aacenc_image.bin:system/etc/aacenc_image.bin \
    device/samsung/totoro/prebuilt/etc/setusbmode.txt:system/etc/setusbmode.txt \
    device/samsung/totoro/prebuilt/etc/vold.conf:system/etc/vold.conf \
    device/samsung/totoro/prebuilt/etc/usbconfig.sh:system/etc/usbconfig.sh \
    device/samsung/totoro/prebuilt/etc/usb_tether.sh:system/etc/usb_tether.sh \
    device/samsung/totoro/prebuilt/etc/usb_portd.conf:system/etc/usb_portd.conf \
    device/samsung/totoro/prebuilt/etc/asound.conf:system/etc/asound.conf \
    device/samsung/totoro/prebuilt/etc/audio/LVVEFS_Rx_Configuration.txt:system/etc/audio/LVVEFS_Rx_Configuration.txt \
    device/samsung/totoro/prebuilt/etc/audio/LVVEFS_Tx_Configuration.txt:system/etc/audio/LVVEFS_Tx_Configuration.txt \
    device/samsung/totoro/prebuilt/etc/audio/Rx_ControlParams_EARPIECE_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_EARPIECE_WIDEBAND.txt \
    device/samsung/totoro/prebuilt/etc/audio/Rx_ControlParams_SPEAKER_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_SPEAKER_WIDEBAND.txt \
    device/samsung/totoro/prebuilt/etc/audio/Rx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt \
    device/samsung/totoro/prebuilt/etc/audio/Rx_ControlParams_WIRED_HEADSET_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_WIRED_HEADSET_WIDEBAND.txt \
    device/samsung/totoro/prebuilt/etc/audio/Tx_ControlParams_EARPIECE_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_EARPIECE_WIDEBAND.txt \
    device/samsung/totoro/prebuilt/etc/audio/Tx_ControlParams_SPEAKER_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SPEAKER_WIDEBAND.txt \
    device/samsung/totoro/prebuilt/etc/audio/Tx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt \
    device/samsung/totoro/prebuilt/etc/audio/Tx_ControlParams_WIRED_HEADSET_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_WIRED_HEADSET_WIDEBAND.txt

# module
PRODUCT_COPY_FILES += \
    device/samsung/totoro/prebuilt/modules/brcm-headsetsw.ko:system/lib/modules/brcm-headsetsw.ko \
    device/samsung/totoro/prebuilt/modules/bcm_headsetsw.ko:system/lib/modules/bcm_headsetsw.ko \
    device/samsung/totoro/prebuilt/modules/brcm_switch.ko:system/lib/modules/brcm_switch.ko \
    device/samsung/totoro/prebuilt/modules/dhd.ko:system/lib/modules/bcm4330.ko \
    device/samsung/totoro/prebuilt/modules/ge_drv.ko:system/lib/modules/ge_drv.ko \
    device/samsung/totoro/prebuilt/modules/gememalloc.ko:system/lib/modules/gememalloc.ko \
    device/samsung/totoro/prebuilt/modules/h6270enc.ko:system/lib/modules/h6270enc.ko \
    device/samsung/totoro/prebuilt/modules/hx170dec.ko:system/lib/modules/hx170dec.ko

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/totoro/totoro-vendor-blobs.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := totoro
PRODUCT_DEVICE := totoro
PRODUCT_MODEL := GT-S5360
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung

