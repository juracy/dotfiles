zsh_log $0 'Configuring fzf'

# Setup fzf
# ---------
# if [[ ! "$PATH" == *$HOMEBREW_PREFIX/opt/fzf/bin* ]]; then
#   export PATH="${PATH:+${PATH}:}$HOMEBREW_PREFIX/opt/fzf/bin"
# fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/share/fzf/key-bindings.zsh" 2> /dev/null

# Key bindings
# ------------
#source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
