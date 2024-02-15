# https://unix.stackexchange.com/questions/313093/can-i-navigate-zshs-tab-completion-menu-with-vi-like-hjkl-keys

zstyle ':completion:*' menu select
zmodload zsh/complist

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect '^[' send-break
