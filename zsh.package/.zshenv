VISUAL=nvim
EDITOR=$VISUAL
APPDATA=$HOME/.config
XDG_CONFIG_HOME=$HOME/.config
XDG_CURRENT_DESKTOP=GNOME

LOCALBIN=$HOME/.local/bin
PATH=$LOCALBIN:$PATH:$HOME/.krew/bin

# Chrome dos MCPs do Claude Code em workspace especial (ver hypr.d/92-claude-chrome.lua).
# O chrome-devtools-mcp só aceita caminho absoluto em arquivo, por isso o config é gerado aqui.
export PLAYWRIGHT_MCP_EXECUTABLE_PATH=$LOCALBIN/claude-chrome
if [[ ! -e $XDG_CONFIG_HOME/cd4a/config.json ]]; then
  mkdir -p $XDG_CONFIG_HOME/cd4a
  print -r -- "{ \"executablePath\": \"$LOCALBIN/claude-chrome\" }" > $XDG_CONFIG_HOME/cd4a/config.json
fi
