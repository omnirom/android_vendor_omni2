LOCAL_PATH := $(call my-dir)

# Set healthd_density to the density bucket of the device.
charger_density := 1080
ifneq (,$(TARGET_BOOTANIMATION_SIZE))
charger_density := $(filter %x,$(TARGET_BOOTANIMATION_SIZE))
endif


define _add-charger-image
include $$(CLEAR_VARS)
LOCAL_MODULE := system_core_charger_$(notdir $(1))
LOCAL_MODULE_STEM := $(notdir $(1))
_img_modules += $$(LOCAL_MODULE)
LOCAL_SRC_FILES := $1
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $$(TARGET_ROOT_OUT)/res/images/charger
include $$(BUILD_PREBUILT)
endef

_img_modules :=
_images :=
$(foreach _img, $(call find-subdir-subdir-files, "images/$(charger_density)", "*.png"), \
  $(eval $(call _add-charger-image,$(_img))))

include $(CLEAR_VARS)
LOCAL_MODULE := omni_charger_res_images
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := $(_img_modules)
include $(BUILD_PHONY_PACKAGE)

_add-charger-image :=
_img_modules :=
                   
