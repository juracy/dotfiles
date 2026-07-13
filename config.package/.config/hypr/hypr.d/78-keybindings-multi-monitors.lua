-- Migrado de 78-keybindings-multi-monitors.conf / swap-workspaces.sh para Lua nativo.

local swap = require("utils.swap-workspaces")

-- Keybindings
-- hl.bind("SUPER + O", hl.dsp.workspace.move({ monitor = "-1" }))
hl.bind("SUPER + SHIFT + O", function()
  swap.swap_focus()
end)
hl.bind("SUPER + CTRL + O", function()
  swap.swap()
end)
