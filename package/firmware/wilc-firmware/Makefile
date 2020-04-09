#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=wilc-firmware
PKG_VERSION:=wilc_linux_15_4_rc1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=http://github.com/linux4wilc/firmware.git
PKG_SOURCE_VERSION:=06a9a9717029bce940d1125b748f61388c995961
PKG_HASH:=aae3ef0bf626770b7a2a478d3058bc9ab5a603d3560af2da995eb507d4a267c1

include $(INCLUDE_DIR)/package.mk

define Package/wilc-firmware
  SECTION:=firmware
  CATEGORY:=Firmware
  URL:=$(PKG_SOURCE_URL)
  DEPENDS:=
  TITLE:=WILC firmware
endef

define Build/Compile
endef

define Package/wilc-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware/mchp
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/*.bin $(1)/lib/firmware/mchp
endef

$(eval $(call BuildPackage,wilc-firmware))
