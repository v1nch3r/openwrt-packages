#
# LuCI Base64 by Reyre <https://youtube.com/@indonesiantech>
# Fix Scripts by Helmi Amirudin <https://www.helmiau.com>
#
# Copyright (C) 2023 Vincher <https://www.facebook.com/v1nch3r>
# This is free software, licensed under the Apache License, Version 2.0
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Base64 App
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+php7 +php7-cgi

PKG_NAME:=luci-app-base64
PKG_VERSION:=1.0
PKG_RELEASE:=1

define Package/$(PKG_NAME)
	$(call Package/luci/webtemplate)
	TITLE:=$(LUCI_TITLE)
	DEPENDS:=$(LUCI_DEPENDS)
endef

define Package/$(PKG_NAME)/description
	This is Base64, but for LuCI OpenWrt.
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	cp -pR ./luasrc/* $(1)/usr/lib/lua/luci
	$(INSTALL_DIR) $(1)/
	cp -pR ./root/* $(1)/
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
	[ -d /tmp/luci-modulecache ] && rm -rf /tmp/luci-modulecache
	find /tmp -type f -name 'luci-indexcache.*' -exec rm -f {} \;
	chmod -R 755 /usr/lib/lua/luci/controller/*
	chmod -R 755 /usr/lib/lua/luci/view/*
	chmod -R 755 /www/*
	chmod -R 755 /www/base64/*
	chmod -R 755 /root/*
	# Autofix download index.php, index.html
	if ! grep -q ".php=/usr/bin/php-cgi" /etc/config/uhttpd; then
		echo -e "  vincherlog : system not using php-cgi, patching php config ..."
		logger "  vincherlog : system not using php-cgi, patching php config..."
		uci set uhttpd.main.ubus_prefix='/ubus'
		uci set uhttpd.main.interpreter='.php=/usr/bin/php-cgi'
		uci set uhttpd.main.index_page='cgi-bin/luci'
		uci add_list uhttpd.main.index_page='index.html'
		uci add_list uhttpd.main.index_page='index.php'
		uci commit uhttpd
		echo -e "  vincherlog : patching system with php configuration done ..."
		echo -e "  vincherlog : restarting some apps ..."
		logger "  vincherlog : patching system with php configuration done..."
		logger "  vincherlog : restarting some apps..."
		/etc/init.d/uhttpd restart
	fi
exit 0
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
	[ -d /www/base64 ] && rm -rf /www/base64
exit 0
endef

include $(TOPDIR)/feeds/luci/luci.mk

$(eval $(call BuildPackage,$(PKG_NAME)))