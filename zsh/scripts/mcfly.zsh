zsh_log $0 'Configuring mcfly'

export MCFLY_FUZZY=2
export MCFLY_RESULTS=35

eval "$(mcfly init zsh)"

# ALT-r para o mcfly (em vez de CTRL-r)
# bindkey '^[r' mcfly-history-widget
