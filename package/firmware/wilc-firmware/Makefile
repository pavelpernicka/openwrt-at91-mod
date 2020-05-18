#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=wilc-firmware
PKG_VERSION:=wilc_linux_15_4_rc2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=http://github.com/linux4wilc/firmware.git
PKG_SOURCE_VERSION:=2a39a7ea49ee6af896a34be9879efff612b6fea5
PKG_HASH:=7c842ee1a8a785e9919cd1feca2a01c90c06e7093fa1e91cc89672f52f9871a2

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
