#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=goagent-client
PKG_VERSION:=3.2.3.20150617
PKG_RELEASE:=1
PKG_MAINTAINER:=shmilee <shmilee.zju@gmail.com>

GOAGENT_LOCAL_FILE:=goagent-local-$(PKG_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=net
  CATEGORY:=Network
  URL:=http://goagent.googlecode.com
  TITLE:=$(PKG_NAME)
  DEPENDS:=+python-pyopenssl +python-gevent +python-dnslib +ca-bundle
endef

define Package/$(PKG_NAME)/description
A gae proxy forked from gappproxy/wallproxy
endef

define Build/Configure
endef

define Build/Compile
	$(TAR) -xvf ./files/$(GOAGENT_LOCAL_FILE) --strip=1 \
		-C $(PKG_BUILD_DIR)
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/share/$(PKG_NAME)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/goagent $(1)/usr/share/$(PKG_NAME)/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/dnsproxy.py $(1)/usr/share/$(PKG_NAME)/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/proxylib.py $(1)/usr/share/$(PKG_NAME)/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/proxy.pac $(1)/usr/share/$(PKG_NAME)/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/goagent.ini $(1)/usr/share/$(PKG_NAME)/
	$(LN) /etc/goagent.user.ini $(1)/usr/share/$(PKG_NAME)/goagent.user.ini
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/goagent.user.ini  $(1)/etc/
endef

$(eval $(call BuildPackage,goagent-client))
