#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=wilc-firmware
PKG_VERSION:=wilc_linux_15_2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=http://github.com/linux4wilc/firmware.git
PKG_SOURCE_VERSION:=a67c351f9028c7a559330365c649a07721965cd4
PKG_HASH:=3cc2859126929c576ae87166663e0eaf48a6b77c2566f330611ccfb656b2e46b

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
