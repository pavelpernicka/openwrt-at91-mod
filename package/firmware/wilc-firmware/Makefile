#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=wilc-firmware
PKG_VERSION:=wilc_linux_15_4_1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=http://github.com/linux4wilc/firmware.git
PKG_SOURCE_VERSION:=6b3897f8a95497c568ab6aa64675137bdeac8fb9
PKG_HASH:=6cf15ab21aa693a7c12f851dd4812cd900298297659b33ba478c176cbc7c0df3

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
