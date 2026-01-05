zsh_log $0 'Configuring auto-suggestions'

# source: https://wiki.archlinux.org/title/Zsh#Key_Bindings
typeset -A key

key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
