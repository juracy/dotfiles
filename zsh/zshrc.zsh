setopt extendedglob
setopt no_check_jobs
setopt no_hup

alias go=xdg-open
alias cdroot='if [ -n "`git rev-parse --show-cdup`" ]; then cd `git rev-parse --show-cdup`; fi'
alias ls='ls --color=yes'

EDITOR=vim
APPDATA=$HOME/.config

stty icrnl

bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

source ~/.zplugrc.zsh
