#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-greenlet
PKG_VERSION:=0.4.12
PKG_RELEASE:=1

PKG_SOURCE:=greenlet-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/be/76/82af375d98724054b7e273b5d9369346937324f9bcc20980b45b068ef0b0/
PKG_MD5SUM:=e8637647d58a26c4a1f51ca393e53c00

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DIR:=$(BUILD_DIR)/greenlet-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-greenlet
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=python-greenlet
  URL:=https://pypi.python.org/pypi/greenlet
  DEPENDS:=+python-light
  MAINTAINER:=shmilee <shmilee.zju@gmail.com>
endef

define Package/python-greenlet/description
The greenlet package is a spin-off of Stackless, a version of CPython
that supports micro-threads called "tasklets". Tasklets run
pseudo-concurrently (typically in a single or a few OS-level threads)
and are synchronized with data exchanges on "channels".

A "greenlet", on the other hand, is a still more primitive notion of
micro-thread with no implicit scheduling; coroutines, in other words.
This is useful when you want to control exactly when your code runs.
You can build custom scheduled micro-threads on top of greenlet; however,
it seems that greenlets are useful on their own as a way to make advanced
control flow structures. For example, we can recreate generators;
the difference with Python's own generators is that our generators can
call nested functions and the nested functions can yield values too.
Additionally, you don't need a "yield" keyword. See the example in
tests/test_generator.py.

Greenlets are provided as a C extension module for the regular
unmodified interpreter.

Greenlets are lightweight coroutines for in-process concurrent programming.
endef

define Build/Compile
	$(call Build/Compile/PyMod,,\
		install --prefix=/usr --root=$(PKG_INSTALL_DIR) \
	)
endef

$(eval $(call PyPackage,python-greenlet))
$(eval $(call BuildPackage,python-greenlet))
