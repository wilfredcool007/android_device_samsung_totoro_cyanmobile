LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),totoro)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
