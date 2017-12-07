--[[
 Copyright (C) 2015 OpenWrt-dist
 Copyright (C) 2016 shmilee
]]--

module("luci.controller.autossh", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/autossh") then
		return
	end

	entry({"admin", "services", "autossh"}, cbi("autossh"), _("AutoSSH"), 60).dependent = true
end
