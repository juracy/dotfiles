local M = {}

-- Troca os workspaces visíveis entre os dois primeiros monitores.
-- Retorna os monitores e os dois primeiros, para reuso em swap_focus.
local function do_swap()
  local mons = hl.get_monitors()
  if #mons < 2 then
    return nil
  end
  local m1, m2 = mons[1], mons[2]
  hl.dispatch(hl.dsp.workspace.swap_monitors({ monitor1 = m1.name, monitor2 = m2.name }))
  return mons, m1, m2
end

function M.swap()
  do_swap()
end

function M.swap_focus()
  local mons, m1, m2 = do_swap()
  if not mons then
    return
  end
  -- foca o "outro" monitor (o que não estava focado antes do swap)
  local focused = nil
  for _, m in ipairs(mons) do
    if m.focused then
      focused = m
    end
  end
  local target = (focused and focused.name == m1.name) and m2 or m1
  hl.dispatch(hl.dsp.focus({ monitor = target.name }))
end

return M
