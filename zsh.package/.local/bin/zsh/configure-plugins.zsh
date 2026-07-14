zsh_log $0 'Configuring plugins'

EMOJI_CLI_KEYBIND=^j
EMOJI_CLI_USE_EMOJI=1
DISTRO=`cat /etc/os-release | grep '^ID=' | cut -d= -f2`

# ohmyzsh's colored-man-pages relies on fg_bold/bg from the `colors` module, which
# isn't autoloaded here, so its less_termcap ends up empty. Override with the same
# raw ANSI codes colored-man-pages_mod used, so `man` stays colored.
typeset -AHg less_termcap
less_termcap[mb]=$'\e[1;31m'
less_termcap[md]=$'\e[1;35m'
less_termcap[me]=$'\e[0m'
less_termcap[se]=$'\e[0m'
less_termcap[so]=$'\e[4;36m'
less_termcap[ue]=$'\e[0m'
less_termcap[us]=$'\e[3;34m'

setopt prompt_subst
