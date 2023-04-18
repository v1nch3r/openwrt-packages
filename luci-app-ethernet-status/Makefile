#
# Copyright (C) 2023 Vincher (https://www.facebook.com/v1nch3r)
#
# This is free software, licensed under the MIT License.
#

include $(TOPDIR)/rules.mk

PKG_VERSION:=1.0
LUCI_TITLE:=Ethernet data infomation for the LuCI status page
LUCI_DEPENDS:=+lua +luci-lib-nixio +luci-lib-jsonc
LUCI_PKGARCH:=all
PKG_LICENSE:=MIT

#include ../../luci.mk
include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
