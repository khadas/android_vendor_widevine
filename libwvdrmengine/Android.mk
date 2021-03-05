LOCAL_PATH:= $(call my-dir)
include $(LOCAL_PATH)/oemcryptolevel.mk
ifneq ($(filter arm arm64, $(TARGET_ARCH)),)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := move_widevine_data.sh
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE := $(LOCAL_SRC_FILES)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := widevine

include $(BUILD_PREBUILT)

# -----------------------------------------------------------------------------
# Builds android.hardware.drm@1.3-service.widevine
#
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := android.hardware.drm@1.3-service.widevine
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_INIT_RC := android.hardware.drm@1.3-service.widevine.rc
LOCAL_VINTF_FRAGMENTS := manifest_android.hardware.drm@1.3-service.widevine.xml
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/bin/hw
LOCAL_PROPRIETARY_MODULE := true
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

# libwvhidl.so
include $(CLEAR_VARS)
LOCAL_MODULE := libwvhidl
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := $(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_PROPRIETARY_MODULE := true
LOCAL_STRIP_MODULE := false
LOCAL_32_BIT_ONLY := true
LOCAL_MODULE_TAGS := optional
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

endif # TARGET_ARCH == arm

