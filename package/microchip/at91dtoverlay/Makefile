#
# Copyright (C) 2016 Microchip Technology Inc.
#     <Sandeepsheriker.mallikarjun@microchip.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=at91dtoverlay
PKG_VERSION:=linux4sam_6.0-rc1
PKG_RELEASE:=

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/linux4sam/dt-overlay-at91.git
PKG_SOURCE_VERSION:=982138405de406a916b525806c1e1b21d4dfbe43

PKG_BUILD_DIR=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include at91dtoverlay.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/image.mk

define AT91DTOverlay/Default
  BUILD_TARGET:=at91
endef

define AT91DTOverlay/sama5d2_xplained
  TITLE:=AT91DTOverlay for SAMA5D2 Xplained board
  BUILD_SUBTARGET:=sama5
  BUILD_DEVICES:=at91-sama5d2_xplained
endef

define AT91DTOverlay/sama5d3_xplained
  TITLE:=AT91DTOverlay for SAMA5D3 Xplained board
  BUILD_SUBTARGET:=sama5
  BUILD_DEVICES:=at91-sama5d3_xplained
endef

define AT91DTOverlay/sama5d4_xplained
  TITLE:=AT91DTOverlay for SAMA5D4 Xplained board
  BUILD_SUBTARGET:=sama5
  BUILD_DEVICES:=at91-sama5d4_xplained
endef

define AT91DTOverlay/sama5d27_som1_ek
  TITLE:=AT91DTOverlay for SAMA5D27 SOM1 Ek
  BUILD_SUBTARGET:=sama5
  BUILD_DEVICES:=at91-sama5d27_som1_ek
endef

AT91DTOVERLAY_TARGETS := \
    sama5d2_xplained \
    sama5d3_xplained \
    sama5d4_xplained \
    sama5d27_som1_ek

define Build/Compile
  $(MAKE) DTC=$(LINUX_DIR)/scripts/dtc/dtc KERNEL_DIR=$(LINUX_DIR) -C $(PKG_BUILD_DIR) $(BUILD_DEVICES:at91-%=%)_dtbos
endef

$(eval $(call BuildPackage/AT91DTOverlay))
