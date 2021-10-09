module("luci.controller.nfs", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/nfs") then
		return
	end
	
	local page = entry({"admin", "services", "nfs"}, cbi("nfs"), _("NFS"))
	page.i18n = "nfs"
	page.dependent = true
	
	
	local page = entry({"mini", "services", "nfs"}, cbi("nfs", {autoapply=true}), _("NFS"))
	page.i18n = "nfs"
	page.dependent = true
end
