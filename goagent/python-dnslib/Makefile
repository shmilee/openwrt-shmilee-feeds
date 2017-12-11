#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-dnslib
PKG_VERSION:=0.9.7
PKG_RELEASE:=1

PKG_SOURCE:=dnslib-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/3a/c0/ee8fe42363b7402c97ddbe468fe2d0a72d93e24d8a264dc72b8963cc5bc0
PKG_MD5SUM:=a0d616a2866ba5b6c7625b2e8d37695e
PKG_LICENSE:=BSD
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DIR:=$(BUILD_DIR)/dnslib-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-dnslib
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  URL:=http://bitbucket.org/paulc/dnslib/
  TITLE:=python-dnslib
  DEPENDS:=+python-light +python-codecs +python-openssl +python-logging
  VARIANT:=python
endef

define Package/python-dnslib/description
A library to encode/decode DNS wire-format packets supporting both
Python 2.7 and Python 3.2+.
endef

define Build/Compile
	$(call Build/Compile/PyMod,,\
		install --prefix=/usr --root=$(PKG_INSTALL_DIR) \
	)
endef

$(eval $(call PyPackage,python-dnslib))
$(eval $(call BuildPackage,python-dnslib))
