#
# Copyright (C) 2008-2014 The LuCI Team <luci@lists.subsignal.org>
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-argon-config
PKG_VERSION:=0.9
PKG_RELEASE:=20210309

LUCI_TITLE:=LuCI page for Argon Config
LUCI_PKGARCH:=all
LUCI_DEPENDS:= \
	+luci-theme-argon \
	+luci-lib-ipkg

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
