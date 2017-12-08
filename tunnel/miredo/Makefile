#
# Copyright (C) 2017 shmilee
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=miredo
PKG_VERSION:=1.2.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://www.remlab.net/files/miredo/
PKG_HASH:=fa26d2f4a405415833669e2e2e22677b225d8f83600844645d5683535ea43149
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS += \
	--with-pic \
	--enable-shared \
	--enable-static \
	--with-gnu-ld \
	--disable-rpath \
	--enable-teredo-client \
	--enable-miredo-user=root \
	--without-Judy \

TARGET_CFLAGS+=-std=gnu99

define Package/miredo/Default
  SECTION:=ipv6
  CATEGORY:=IPv6
  SUBMENU:=miredo: Teredo (IPv6 tunneling over UDP through NAT)
  URL:=http://www.remlab.net/miredo/
  MAINTAINER:=shmilee <shmilee.zju@gmail.com>
endef

define Package/miredo/Default/description
 Miredo is an open-source Teredo IPv6 tunneling software, for Linux and
 the BSD operating systems. It includes functional implementations of all
 components of the Teredo specification (client, relay and server).
 It is meant to provide IPv6 connectivity even from behind NAT devices.
endef

define Package/miredo-common
$(call Package/miredo/Default)
  TITLE:=Teredo (IPv6 tunneling over UDP through NAT) shared libraries
  DEPENDS+=+ip +libpthread +librt +kmod-ipv6 +kmod-tun
endef

define Package/miredo-server
$(call Package/miredo/Default)
  TITLE:=Teredo (IPv6 tunneling over UDP through NAT) server daemon
  DEPENDS+= +miredo-common
endef

define Package/miredo-server/conffiles
/etc/miredo/miredo-server.conf
endef

define Package/miredo-client
$(call Package/miredo/Default)
  TITLE:=Teredo (IPv6 tunneling over UDP through NAT) client and relay daemon
  DEPENDS+= +miredo-common
endef

define Package/miredo-client/conffiles
/etc/miredo/miredo.conf
endef

define Package/miredo-common/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/lib{teredo,tun6}.so.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/miredo
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/miredo/miredo-privproc $(1)/usr/lib/miredo
endef

define Package/miredo-server/install
	$(INSTALL_DIR) $(1)/etc/miredo
	$(CP) $(PKG_INSTALL_DIR)/usr/share/doc/miredo/examples/miredo-server.conf $(1)/etc/miredo/miredo-server.conf
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/miredo-server.init $(1)/etc/init.d/miredo-server
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/miredo-server $(1)/usr/sbin/
endef

define Package/miredo-client/install
	$(INSTALL_DIR) $(1)/etc/miredo
	$(CP) $(PKG_INSTALL_DIR)/usr/share/doc/miredo/examples/miredo.conf $(1)/etc/miredo/miredo.conf
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/etc/miredo/client-hook $(1)/etc/miredo
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/miredo.init $(1)/etc/init.d/miredo
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/miredo $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/miredo-checkconf $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,miredo-common))
$(eval $(call BuildPackage,miredo-server))
$(eval $(call BuildPackage,miredo-client))
