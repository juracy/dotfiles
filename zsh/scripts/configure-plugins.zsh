zsh_log $0 'Configuring plugins'

ENHANCD_FILTER=fzf
EMOJI_CLI_KEYBIND=^j
EMOJI_CLI_USE_EMOJI=1
DISTRO=`cat /etc/os-release | grep '^ID=' | cut -d= -f2`

setopt prompt_subst
unalias fd
