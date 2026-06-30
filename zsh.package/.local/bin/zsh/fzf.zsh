zsh_log $0 'Configuring fzf'

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/share/fzf/key-bindings.zsh" 2> /dev/null

# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -l $realpath'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
