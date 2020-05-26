#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=wilc-firmware
PKG_VERSION:=wilc_linux_15_4

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=http://github.com/linux4wilc/firmware.git
PKG_SOURCE_VERSION:=90555cfffefb4bf57d1c8b69fd4f16961d8950ac
PKG_HASH:=24007375fd788c0c20f8005a11018494ab8fa4eab4d67458ae0fc91ea660bd45

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
