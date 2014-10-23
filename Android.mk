LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_UEFI_ARCH),i386)
    loader_arch := linux-x86
    arch_name := ia32
else
    loader_arch := linux-x86_64
    arch_name := x86_64
endif

gnu_efi_base := $(LOCAL_PATH)/$(loader_arch)

include $(CLEAR_VARS)
LOCAL_MODULE := libgnuefi
LOCAL_EXPORT_C_INCLUDE_DIRS := $(gnu_efi_base)/include/efi $(gnu_efi_base)/include/efi/$(arch_name)
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_PREBUILT_MODULE_FILE := $(gnu_efi_base)/lib/libgnuefi.a
LOCAL_MODULE_SUFFIX := .a
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libefi
LOCAL_EXPORT_C_INCLUDE_DIRS := $(gnu_efi_base)/include/efi $(gnu_efi_base)/include/efi/$(arch_name)
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_PREBUILT_MODULE_FILE := $(gnu_efi_base)/lib/libefi.a
LOCAL_MODULE_SUFFIX := .a
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := crt0-efi
LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_PREBUILT_MODULE_FILE := $(gnu_efi_base)/lib/crt0-efi-$(arch_name).o
LOCAL_MODULE_SUFFIX := .o
include $(BUILD_PREBUILT)

