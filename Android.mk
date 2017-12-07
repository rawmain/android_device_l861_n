LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),l861)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
