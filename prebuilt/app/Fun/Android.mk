LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := EggGame
LOCAL_SRC_FILES := EggGame.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_PATH  := $(TARGET_OUT_APPS)
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)
