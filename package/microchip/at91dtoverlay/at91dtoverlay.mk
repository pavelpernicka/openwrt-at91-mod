
PKG_TARGETS := bin
PKG_FLAGS:=nonshared

export GCC_HONOUR_COPTS=s

define Package/at91dtoverlay/install/default
  $(INSTALL_DIR) $(1)/$(BUILD_DEVICES:at91-%=%) && \
  $(CP) -av $(PKG_BUILD_DIR)/$(BUILD_DEVICES:at91-%=%)/*.dtbo $(1)/$(BUILD_DEVICES:at91-%=%)/ && \
  $(CP) -av $(PKG_BUILD_DIR)/$(BUILD_DEVICES:at91-%=%).its $(1)/
endef

Package/at91dtoverlay/install = $(Package/at91dtoverlay/install/default)

define AT91DTOverlay/Init
  BUILD_TARGET:=
  BUILD_SUBTARGET:=
  BUILD_DEVICES:=
  NAME:=
  DEPENDS:=
  HIDDEN:=
  DEFAULT:=
  VARIANT:=$(1)
endef

TARGET_DEP = TARGET_$(BUILD_TARGET)$(if $(BUILD_SUBTARGET),_$(BUILD_SUBTARGET))

define Build/AT91DTOverlay/Target
  $(eval $(call AT91DTOverlay/Init,$(1)))
  $(eval $(call AT91DTOverlay/Default,$(1)))
  $(eval $(call AT91DTOverlay/$(1),$(1)))

 define Package/at91dtoverlay-$(1)
    SECTION:=AT91 Device Tree Overlay's
    CATEGORY:=Microchip Packages
    SUBMENU:=AT91 Device Tree Overlay's
    TITLE:= .$(NAME)
    VARIANT:=$(VARIANT)
    DEPENDS:=@!IN_SDK $(DEPENDS)
    HIDDEN:=$(HIDDEN)
    ifneq ($(BUILD_TARGET),)
      DEPENDS += @$(TARGET_DEP)
      ifneq ($(BUILD_DEVICES),)
        DEFAULT := y if ($(TARGET_DEP)_Default \
        $(patsubst %,|| $(TARGET_DEP)_DEVICE_%,$(BUILD_DEVICES)) \
        $(patsubst %,|| $(patsubst TARGET_%,TARGET_DEVICE_%, \
           $(TARGET_DEP))_DEVICE_%,$(BUILD_DEVICES)))
      endif
    endif
    $(if $(DEFAULT),DEFAULT:=$(DEFAULT))
    URL:=https://www.at91.com/linux4sam
  endef

  define Package/at91dtoverlay-$(1)/install
    $$(Package/at91dtoverlay/install)
  endef
endef

define Build/Compile/AT91DTOverlay
   +$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
       CROSS_COMPILE=$(TARGET_CROSS)
endef

define BuildPackage/AT91DTOverlay/Defaults
  Build/Compile/Default = $$$$(Build/Compile/AT91DTOverlay)
endef

define BuildPackage/AT91DTOverlay
  $(eval $(call BuildPackage/AT91DTOverlay/Defaults))
  $(foreach type,$(if $(DUMP),$(AT91DTOVERLAY_TARGETS),$(BUILD_VARIANT)), \
    $(eval $(call Build/AT91DTOverlay/Target,$(type)))
  )
  $(eval $(call Build/DefaultTargets))
  $(foreach type,$(if $(DUMP),$(AT91DTOVERLAY_TARGETS),$(BUILD_VARIANT)), \
    $(call BuildPackage,at91dtoverlay-$(type))
  )
endef
