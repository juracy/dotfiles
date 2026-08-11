local M = {}

-- Primeiro monitor da lista cujo nome não é focused_name.
local function find_other_monitor(mons, focused_name)
  for _, m in ipairs(mons) do
    if m.name ~= focused_name then
      return m
    end
  end
  return nil
end

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
  local target = find_other_monitor(mons, focused and focused.name)
  hl.dispatch(hl.dsp.focus({ monitor = target.name }))
end

-- Move todos os workspaces normais (não especiais) do monitor focado para o
-- outro monitor, e segue o foco para o destino.
function M.move_all_to_other()
  local focused = hl.get_active_monitor()
  if not focused then
    return
  end

  -- Resolve o monitor de destino uma única vez, pelo nome: mover o workspace
  -- ativo pode fazer o Hyprland trocar o foco de monitor no meio do laço, e
  -- aí o seletor relativo "-1" passaria a apontar para outro monitor a cada
  -- dispatch, movendo os workspaces seguintes para o lugar errado.
  local target = find_other_monitor(hl.get_monitors(), focused.name)
  if not target then
    return
  end

  local workspaces = hl.get_workspaces()
  for _, ws in ipairs(workspaces) do
    if not ws.special and ws.monitor and ws.monitor.name == focused.name then
      hl.dispatch(hl.dsp.workspace.move({ workspace = ws.id, monitor = target.name }))
    end
  end

  hl.dispatch(hl.dsp.focus({ monitor = target.name }))
end

return M
