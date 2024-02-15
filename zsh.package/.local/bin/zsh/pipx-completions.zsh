zsh_log $0 'Configuring pipx completions'

autoload -U bashcompinit
bashcompinit

eval "$(register-python-argcomplete pipx)"
