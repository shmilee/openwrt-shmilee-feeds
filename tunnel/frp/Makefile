#
# Copyright (C) 2012-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=frp
PKG_VERSION:=0.14.1
PKG_RELEASE:=1

ifneq (,$(findstring $(ARCH), arm mips mips64))
  PKG_SOURCE_ARCH:=$(ARCH)
else ifeq ($(ARCH),i386)
  PKG_SOURCE_ARCH:=386
else ifeq ($(ARCH),x86_64)
  PKG_SOURCE_ARCH:=amd64
else ifeq ($(ARCH),mipsel)
  PKG_SOURCE_ARCH:=mipsle
else ifeq ($(ARCH),mips64el)
  PKG_SOURCE_ARCH:=mips64le
endif
PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION)_linux_$(PKG_SOURCE_ARCH).tar.gz
PKG_HASH:=
PKG_SOURCE_URL:=https://github.com/fatedier/frp/releases/download/v$(PKG_VERSION)
PKG_MAINTAINER:=shmilee <shmilee.zju@gmail.com>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENCE

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)_$(PKG_VERSION)_linux_$(PKG_SOURCE_ARCH)

include $(INCLUDE_DIR)/package.mk

define Package/frp/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet
  URL:=https://github.com/fatedier/frp
  DEPENDS:=
endef

define Package/frp/Default/description
frp is a fast reverse proxy to help you expose a local server behind a NAT
or firewall to the internet. Now, it supports tcp, udp, http and https
protocol when requests can be forwarded by domains to backward web services.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/frpc
$(call Package/frp/Default)
  TITLE+= (client)
endef

define Package/frpc/description
$(call Package/frp/Default/description)
This package contains the frp client.
endef

define Package/frpc/conffiles
/etc/frp/frpc.ini
endef

define Package/frpc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/frpc $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/frp
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/frpc.ini $(1)/etc/frp/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/frpc_full.ini $(1)/etc/frp/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/frpc.init $(1)/etc/init.d/frpc
endef

define Package/frps
$(call Package/frp/Default)
  TITLE+= (server)
endef

define Package/frps/description
$(call Package/frp/Default/description)
This package contains the frp server.
endef

define Package/frps/conffiles
/etc/frp/frps.ini
endef

define Package/frps/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/frps $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/frp
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/frps.ini $(1)/etc/frp/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/frps_full.ini $(1)/etc/frp/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/frps.init $(1)/etc/init.d/frps
endef

$(eval $(call BuildPackage,frpc))
$(eval $(call BuildPackage,frps))
