-- gen by confToLua.py
-- Source: 20-exec.conf
-- Some values might need MANUAL check. PLEASE DO BACKUP BEFORE TESTING, PLEASEEEE.


hl.on("hyprland.start", function()
	hl.exec_cmd("~/.config/hypr/autostart.sh")
end)

-- raw lines, pending review
-- [failes migration] exec-shutdown = killall zed-editor
