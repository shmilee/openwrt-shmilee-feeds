--[[
 Copyright (C) 2016 shmilee
]]--

m = Map("autossh", translate("AutoSSH"),
	translate("Monitor and Restart ssh sessions"))

s = m:section(TypedSection, "autossh", translate("AutoSSH Setting"))
s.anonymous   = true
s.addremove   = true

o = s:option(Flag, "enabled", translate("Enable"))
o.rmempty = false

o = s:option(Value, "ssh", translate("SSH Options"))
o.rmempty     = false

o = s:option(Value, "gatetime", translate("Gate Time"))
o.placeholder = 0
o.default     = 0
o.datatype    = "uinteger"

o = s:option(Value, "monitorport", translate("Monitoring Port"))
o.datatype    = "port"
o.default     = 20000
o.rmempty     = false

o = s:option(Value, "poll", translate("Poll Time"))
o.placeholder = 600
o.default     = 600
o.datatype    = "uinteger"

return m
