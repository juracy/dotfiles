-- gen by confToLua.py
-- Source: 91-qalculate.conf
-- Some values might need MANUAL check. PLEASE DO BACKUP BEFORE TESTING, PLEASEEEE.


-- Variables
calculator = "qalculate-gtk"

-- Keybindings
hl.bind("SUPER + F10", hl.dsp.exec_cmd("pgrep qalculate-gtk && hyprctl dispatch togglespecialworkspace magic || qalculate-gtk &"))

-- Windowrules
hl.window_rule({
	name  = "qalculate",
	match = { class = "(qalculate-gtk)" },
	float = true,
	workspace = "special:magic",
	size = { 750, 500 },
	move = "((monitor_w-window_w)/2) ((monitor_h-window_h)/2)",
})
