#
# Copyright (C) 2016 Openwrt.org
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-vlmcsd

# Version == major.minor.patch
# increase on new functionality (minor) or patches (patch)
PKG_VERSION:=1.0.1

# Release == build
# increase on changes of translation files
PKG_RELEASE:=1

PKG_LICENSE:=MIT
PKG_MAINTAINER:=shmilee <shmilee.zju@gmail.com>

# LuCI specific settings
LUCI_TITLE:=LuCI Support for vlmcsd
LUCI_DEPENDS:=+luci-base +luci-compat +vlmcsd
LUCI_PKGARCH:=all

define Package/$(PKG_NAME)/config
# shown in make menuconfig <Help>
help
		$(LUCI_TITLE)
		Version: $(PKG_VERSION)-$(PKG_RELEASE)
		$(PKG_MAINTAINER)
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
