#
# Copyright (C) 2012-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=frp
PKG_VERSION:=0.37.1
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
PKG_HASH:=5ad100e07c3daf5a0d24f09363047b425ef8ff08ced4fff781167888e965e4f8
PKG_SOURCE_URL:=https://github.com/fatedier/frp/releases/download/v$(PKG_VERSION)
PKG_MAINTAINER:=shmilee <shmilee.zju@gmail.com>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENCE

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)_$(PKG_VERSION)_linux_$(PKG_SOURCE_ARCH)

include $(INCLUDE_DIR)/package.mk

define Package/frp/template
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=frp - fast reverse proxy
  URL:=https://github.com/fatedier/frp
  DEPENDS:=
endef

define Package/frpc
  $(call Package/frp/template)
  TITLE+= (client)
endef

define Package/frps
  $(call Package/frp/template)
  TITLE+= (server)
endef

define Package/frp/description
  frp is a fast reverse proxy to help you expose a local server behind
  a NAT or firewall to the internet.
endef
Package/frpc/description = $(Package/frp/description)
Package/frps/description = $(Package/frp/description)

define Build/Configure
endef

define Build/Compile
endef

define Package/frp/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(2) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/frp/$(2).d/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/$(2).ini $(1)/etc/frp/$(2).d/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/$(2)_full.ini $(1)/etc/frp/$(2).d/
	$(INSTALL_DIR) $(1)/etc/config/
	$(INSTALL_CONF) ./files/$(2).config $(1)/etc/config/$(2)
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/$(2).init $(1)/etc/init.d/$(2)
endef

define Package/frpc/conffiles
/etc/config/frpc
endef

define Package/frps/conffiles
/etc/config/frps
endef

define Package/frpc/install
  $(call Package/frp/install,$(1),frpc)
endef

define Package/frps/install
  $(call Package/frp/install,$(1),frps)
endef

$(eval $(call BuildPackage,frpc))
$(eval $(call BuildPackage,frps))
