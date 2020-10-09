zsh_log $0 'Configuring aliases'

alias go=xdg-open
alias cdroot='if [ -n "`git rev-parse --show-cdup`" ]; then cd `git rev-parse --show-cdup`; fi'
alias ls='ls --color=yes'
alias please='sudo $(fc -ln -1)'
