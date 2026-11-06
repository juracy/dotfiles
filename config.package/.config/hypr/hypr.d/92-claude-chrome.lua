-- Chrome dos MCPs do Claude Code: fica escondido em um workspace especial, sem roubar o foco.
-- A classe vem do wrapper ~/.local/bin/claude-chrome.

-- Keybindings
hl.bind("SUPER + F8", hl.dsp.workspace.toggle_special("claude"), { description = "Toggle Claude Chrome" })

-- Windowrules
hl.window_rule({
	name  = "claude-chrome",
	match = { initial_class = "^(claude-chrome)$" },
	workspace = "special:claude silent",
	no_initial_focus = true,
	float = true,
	center = true,
	size = {"monitor_w * 0.9", "monitor_h * 0.9"},
})
