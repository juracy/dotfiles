-- Keybindings
hl.bind("XF86Search", hl.dsp.exec_cmd(menu))
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("dms ipc call lock lock"), { locked = true })
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd(suspend), { locked = true })
