# Tilix and VTE Support
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

SHELL=`which $0`

setopt extendedglob
setopt no_check_jobs
setopt no_hup

alias go=xdg-open
alias cdroot='if [ -n "`git rev-parse --show-cdup`" ]; then cd `git rev-parse --show-cdup`; fi'
alias ls='ls --color=yes'
alias please='sudo $(fc -ln -1)'

stty icrnl

bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

# Necessário instalar o starship
eval "$(starship init zsh)"
source ~/.zplugrc.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
