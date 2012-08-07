# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# Board
LOCAL_PATH:= $(call my-dir)

TARGET_BOARD_PLATFORM := bcm21553
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp

WITH_DEXPREOPT := false

TARGET_BOOTLOADER_BOARD_NAME := totoro

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_OTA_ASSERT_DEVICE := totoro,GT-S5360

TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true
# disable for now until fix
# TARGET_PROVIDES_LIBUI := true

BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_ALSA_AUDIO := true
BOARD_HAVE_BLUETOOTH := true

BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
BOARD_FM_DEVICE := bcm4329
TARGET_SENSORS_NO_OPEN_CHECK := true
# Camera
USE_CAMERA_STUB := true
# we not need this (need haxx to the kernel)
#BOARD_V4L2_DEVICE := /dev/video2
#BOARD_CAMERA_DEVICE := /dev/video0
BOARD_USE_JPEG := true

# 2d/3d
BOARD_EGL_CFG := device/samsung/totoro/egl.cfg
BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_HARDWARE_3D := false
BOARD_HAS_LIMITED_EGL := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true
TARGET_SF_NEEDS_REAL_DIMENSIONS := true
TARGET_DO_NOT_SETS_CAN_DRAW := true
BOARD_USE_YUV422I_DEFAULT_COLORFORMAT := true
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_MOBILEDATA_INTERFACE_NAME := "pdp0"
TARGET_USES_GL_VENDOR_EXTENSIONS := true
BOARD_NO_32BPP := true
BOARD_NO_PAGE_FLIPPING := true
TARGET_ELECTRONBEAM_FRAMES := 8

# Misc
JS_ENGINE := v8
WITH_JIT := true
ENABLE_JSC_JIT := true
BOARD_USE_SCREENCAP:= true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_FORCE_STATIC_A2DP := true

# usb
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/lm-2/gadget/lun0/file"
BOARD_UMS_LUNFILE := "/sys/devices/lm-2/gadget/lun0/file"

BOARD_NAND_PAGE_SIZE := 4096 -s 128
BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x81600000	 
BOARD_KERNEL_PAGESIZE := 4096
TARGET_PREBUILT_KERNEL := device/samsung/totoro/kernel	
TARGET_RECOVERY_INITRC := device/samsung/totoro/recovery.rc

TARGET_USERIMAGES_USE_EXT4 := false
BOARD_BML_BOOT := "/dev/block/bml7"
BOARD_BML_RECOVERY := "/dev/block/bml8"
BOARD_BOOTIMAGE_PARTITION_SIZE := 5242880
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 5575680
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 241172480
BOARD_USERDATAIMAGE_PARTITION_SIZE := 206831616
BOARD_FLASH_BLOCK_SIZE := 131072
TOUCHPAD_INPUT_DEVICE_ID := 1023

BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/totoro/recovery/recovery_ui.c
# BOARD_CUSTOM_GRAPHICS           := ../../device/samsung/totoro/recovery/graphics.c
BOARD_HAS_SMALL_RECOVERY := true
BOARD_LDPI_RECOVERY := true
BOARD_RECOVERY_HANDLES_MOUNT := true

# Wifi
CONFIG_DRIVER_BROADCOM := true
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_5_X
BOARD_WLAN_DEVICE 	    := dhd
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/bcm4330_sta.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/bcm4330_aps.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/bcm4330_sta.bin nvram_path=/system/etc/wifi/nvram.txt"
WIFI_DRIVER_MODULE_NAME     := "dhd"
