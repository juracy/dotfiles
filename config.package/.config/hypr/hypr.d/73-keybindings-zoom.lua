-- gen by confToLua.py
-- Source: 73-keybindings-zoom.conf
-- Some values might need MANUAL check. PLEASE DO BACKUP BEFORE TESTING, PLEASEEEE.

local zoom = require("utils.zoom")

-- Faster zoom speed
hl.config({
	binds = {
		scroll_event_delay = 0,
	},
})

-- Keybindings
hl.bind("SUPER + mouse_down", function()
  zoom.zoom_in()
end)
hl.bind("SUPER + mouse_up", function()
  zoom.zoom_out()
end)
hl.bind("SUPER + mouse:274",  function()
  zoom.zoom_reset()
end)
hl.bind("SUPER + equal", function()
  zoom.zoom_in()
end, { repeating = true })
hl.bind("SUPER + minus", function()
  zoom.zoom_out()
end, { repeating = true })
hl.bind("SUPER + KP_ADD", function()
  zoom.zoom_in()
end, { repeating = true })
hl.bind("SUPER + KP_SUBTRACT", function()
  zoom.zoom_out()
end, { repeating = true })
