include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Tiny File Manager App
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+php7 +php7-cgi +php7-mod-session +php7-mod-ctype +php7-mod-fileinfo +php7-mod-zip +php7-mod-iconv +php7-mod-mbstring +zoneinfo-asia 

PKG_NAME:=luci-app-tinyfm
PKG_VERSION:=1.0
PKG_RELEASE:=1

define Package/$(PKG_NAME)
	$(call Package/luci/webtemplate)
	TITLE:=$(LUCI_TITLE)
	DEPENDS:=$(LUCI_DEPENDS)
endef

define Package/$(PKG_NAME)/description
	This is Tiny File Manager, but for LuCI OpenWrt.
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	cp -pR ./luasrc/* $(1)/usr/lib/lua/luci
	$(INSTALL_DIR) $(1)/
	cp -pR ./root/* $(1)/
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
	[ -d /www/tinyfm ] && rm -rf /www/tinyfm
exit 0
endef

include $(TOPDIR)/feeds/luci/luci.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
