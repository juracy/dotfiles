# https://unix.stackexchange.com/questions/273861/unlimited-history-in-zsh/273929
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

export WORKON_HOME=$HOME/.virtualenvs

alias go=xdg-open
alias cdroot='if [ -n "`git rev-parse --show-cdup`" ]; then cd `git rev-parse --show-cdup`; fi'
alias ls='ls --color=yes'

source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

export EDITOR="vim"
export APPDATA=$HOME/.config
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

setopt NO_CHECK_JOBS
setopt NO_HUP

source ~/.zplugrc.zsh
source ~/.ng-completion.zsh
