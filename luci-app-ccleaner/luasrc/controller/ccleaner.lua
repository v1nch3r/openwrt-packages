module("luci.controller.ccleaner",package.seeall)
function index()
	entry({"admin","status","ccleaner"}, call("ccleaner"), _("CCleaner"), 6)
end
function ccleaner()
	luci.sys.call("/sbin/clearcache.sh >/dev/null 2>&1")
	luci.http.redirect(luci.dispatcher.build_url("admin/status"))
end
