# https://unix.stackexchange.com/questions/273861/unlimited-history-in-zsh/273929
setopt extendedglob
setopt extended_history          # Write the history file in the ":start:elapsed;command" format.
setopt inc_append_history        # Write to the history file immediately, not when the shell exits.
setopt appendhistory
setopt share_history             # Share history between all sessions.
setopt hist_expire_dups_first    # Expire duplicate entries first when trimming history.
setopt hist_ignore_dups          # Don't record an entry that was just recorded again.
setopt hist_ignore_all_dups      # Delete old recorded entry if new entry is a duplicate.
setopt hist_find_no_dups         # Do not display a line previously found.
setopt hist_ignore_space         # Don't record an entry starting with a space.
setopt no_check_jobs
setopt no_hup

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

alias go=xdg-open
alias cdroot='if [ -n "`git rev-parse --show-cdup`" ]; then cd `git rev-parse --show-cdup`; fi'
alias ls='ls --color=yes'
alias venv='source .venv/bin/activate'

EDITOR=vim
APPDATA=$HOME/.config

stty icrnl

bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

# Virtualenv
DISTRO=`cat /etc/os-release | grep '^ID=' | cut -d= -f2`
WORKON_HOME=$HOME/.virtualenvs

if [ "$DISTRO" = "ubuntu" ]; then
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
else
    source `which virtualenvwrapper.sh`
fi

source ~/.zplugrc.zsh
