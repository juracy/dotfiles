-- gen by confToLua.py
-- Source: 80-rules.conf
-- Some values might need MANUAL check. PLEASE DO BACKUP BEFORE TESTING, PLEASEEEE.


-- Windowrules
hl.window_rule({
	name  = "rule-001",
	match = { class = "^(org.pulseaudio.pavucontrol)$" },
	float = true,
})
hl.window_rule({
	name  = "rule-002",
	match = { class = "^(Gtkperf)$" },
	float = true,
})
hl.window_rule({
	name  = "rule-003",
	match = { class = "^(org.zealdocs.zeal)$" },
	float = true,
})
hl.window_rule({
	name  = "rule-004",
	match = { class = "^(nm-connection-editor)$" },
	float = true,
})
hl.window_rule({
	name  = "rule-005",
	match = { class = "^(org.quickshell)$" },
	float = true,
})
hl.window_rule({
	name  = "rule-007",
	match = { class = "^(nwg-look)$" },
	float = true,
})
hl.window_rule({
	name  = "open-dialog",
	match = { class = "^([Xx]dg-desktop-portal-gtk)$" },
	float = true,
	center = true,
})
hl.window_rule({
	name  = "kitty-scripts",
	match = { class = "^(kitty-scripts)$" },
	float = true,
	center = false,
	size = { 700, 350 },
})
hl.window_rule({
	name  = "diffpdf",
	match = { class = "^(eu.qtrac.diffpdf)$" },
	float = true,
	size = {"monitor_w * 0.9", "monitor_h * 0.9"},
})
hl.window_rule({
	name  = "calculator",
	match = { class = "^(org.gnome.Calculator)$" },
	float = true,
	size = { 360, 600 },
})
hl.window_rule({
	name  = "satty",
	match = { class = "^(com.gabm.satty)$" },
	float = true,
    workspace = "special:print",
	no_initial_focus = true,
	center = true,
	pin = true,
    stay_focused = true,
	border_color = "rgb(FF0000)",
})
hl.window_rule({
	name  = "rule-015",
	match = { fullscreen = true },
	opacity = "1.0",
})
hl.window_rule({
	name  = "rule-016",
	match = { title = "(.*)(- YouTube)(.*)" },
	opacity = "1.0",
})
hl.window_rule({
	name  = "gnupg-prompter",
	match = { class = "gcr-prompter" },
	pin = true,
	stay_focused = true,
    border_color = "rgb(FF0000)",
	move = {"((cursor_x - window_w)/2)", "((cursor_y-window_h)/2)"},
	dim_around = true,
})
hl.window_rule({
	name  = "rule-018",
	match = { class = "kitty" },
	animation = "popin",
})
hl.window_rule({
	name  = "rule-019",
	match = { class = ".*" },
	suppress_event = "maximize",
})
hl.window_rule({
	name  = "xwayland",
	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
	no_focus = true,
})
hl.window_rule({
	name  = "zed-settings",
	match = { initial_title = "Zed — Settings" },
	float = true,
	move = {"((monitor_w-window_w)/2)", "((monitor_h-window_h)/2)"},
})
