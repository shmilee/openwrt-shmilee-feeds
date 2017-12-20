#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-pyopenssl
PKG_VERSION:=0.13
PKG_RELEASE:=1

PKG_SOURCE:=pyOpenSSL-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/p/pyOpenSSL/
PKG_MD5SUM:=767bca18a71178ca353dff9e10941929

PKG_BUILD_DIR:=$(BUILD_DIR)/pyOpenSSL-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-pyopenssl
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-pyopenssl
  URL:=http://pyopenssl.sourceforge.net/
  DEPENDS:=+python-light +libopenssl +python-ctypes
  MAINTAINER:=shmilee <shmilee.zju@gmail.com>
endef

define Package/python-pyopenssl/description
  Python interface to the OpenSSL library.
endef

define Build/Compile
	$(call Build/Compile/PyMod,, \
		install --prefix=/usr --root=$(PKG_INSTALL_DIR) \
	)
endef

$(eval $(call PyPackage,python-pyopenssl))
$(eval $(call BuildPackage,python-pyopenssl))
