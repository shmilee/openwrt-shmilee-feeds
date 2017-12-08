#
# Copyright (C) 2016 OpenWrt.org
# Copyright (C) 2017 shmilee
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ariang
PKG_VERSION:=0.3.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/mayswind/AriaNg/releases/download/$(PKG_VERSION)
PKG_SOURCE:=aria-ng-$(PKG_VERSION).zip
PKG_MD5SUM:=936496158308dc2047061cf9a2281f58
PKG_LICENSE:=MIT

UNPACK_CMD=unzip -d $(PKG_BUILD_DIR)/ $(DL_DIR)/$(PKG_SOURCE)

include $(INCLUDE_DIR)/package.mk

define Package/ariang
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Download Manager
  DEPENDS:=
  TITLE:=A Better Web Frontend for aria2
  URL:=https://github.com/mayswind/AriaNg
  PKGARCH:=all
  MAINTAINER:=shmilee <shmilee.zju@gmail.com>
endef

define Package/ariang/description
	A Better Frontend for aria2 written in pure html & javascript.
endef

define Build/Compile
endef

define Package/ariang/install
	$(INSTALL_DIR) $(1)/www/ariang
	$(CP) $(PKG_BUILD_DIR)/css $(1)/www/ariang
	$(CP) $(PKG_BUILD_DIR)/fonts $(1)/www/ariang
	$(CP) $(PKG_BUILD_DIR)/js $(1)/www/ariang
	$(CP) $(PKG_BUILD_DIR)/langs $(1)/www/ariang
	$(CP) $(PKG_BUILD_DIR)/index.html $(1)/www/ariang
	$(CP) $(PKG_BUILD_DIR)/index.manifest $(1)/www/ariang
	$(CP) $(PKG_BUILD_DIR)/LICENSE $(1)/www/ariang
	$(CP) $(PKG_BUILD_DIR)/robots.txt $(1)/www/ariang
endef

$(eval $(call BuildPackage,ariang))
