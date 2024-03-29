#
# Copyright (C) 2015-2016 OpenWrt.org
# Copyright (C) 2017-2021 shmilee
# 
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=adbyby
PKG_VERSION:=2.7
PKG_RELEASE:=20200315

PKG_SOURCE_PROTO:=svn
PKG_SOURCE_URL:=https://github.com/coolsnowwolf/lede/trunk/package/lean/adbyby
PKG_SOURCE_VERSION:=3000
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE)-r$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.gz
PKG_MIRROR_HASH:=e72cbbc0a49aca1356e705f2508db4dec77aeafdad8774e2da39d539a45aea67

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Powerful adblock module to block ad.
	DEPENDS:=
	URL:=http://www.adbyby.com/
endef

define Package/$(PKG_NAME)/description
Adbyby is a powerful adblock module to block ad,just like adblock.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/share/adbyby
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/adbyby.sh $(1)/usr/share/adbyby/
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/files/adhook.ini $(1)/usr/share/adbyby/
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/files/user.action $(1)/usr/share/adbyby/

	$(INSTALL_DIR) $(1)/usr/share/adbyby/data
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/data/* $(1)/usr/share/adbyby/data/

	$(INSTALL_DIR) $(1)/usr/share/adbyby/doc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/files/doc/* $(1)/usr/share/adbyby/doc/

ifeq ($(ARCH),mipsel)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/mipsle/adbyby $(1)/usr/share/adbyby/
endif
ifeq ($(ARCH),mips)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/mips/adbyby $(1)/usr/share/adbyby/
endif
ifeq ($(ARCH),i386)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/x86/adbyby $(1)/usr/share/adbyby/
endif
ifeq ($(ARCH),x86_64)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/amd64/adbyby $(1)/usr/share/adbyby/
endif
ifeq ($(ARCH),arm)
	ifeq ($(BOARD),bcm53xx)
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/arm/adbyby $(1)/usr/share/adbyby/
	else ifeq ($(BOARD),kirkwood)
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/arm/adbyby $(1)/usr/share/adbyby/
	else
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/armv7/adbyby $(1)/usr/share/adbyby/
	endif
endif
ifeq ($(ARCH),aarch64)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/armv7/adbyby $(1)/usr/share/adbyby/
endif
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
