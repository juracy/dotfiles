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

# Path to your oh-my-zsh configuration.
# ZSH=$HOME/.oh-my-zsh

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=( \
#     branch \
#     colored-man-pages colorize \
#     cp \
#     django \
#     docker docker-compose \
#     git git-extras \
#     history \
#     mvn \
#     ng \
#     npm \
#     pip python \
#     rsync \
#     sudo \
#     ubuntu \
#     vagrant \
#     yarn \
# )

export WORKON_HOME=$HOME/.virtualenvs
export PATH="/home/juracy/.local/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#autoload -Uz vcs_info
#zstyle ':vcs_info:*' enable svn cvs
#precmd() {
#    vcs_info
#}
#setopt prompt_subst
#export PROMPT="${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}${vcs_info_msg_0_}%{$fg_bold[blue]%} % %{$reset_color%}"

# bindkey ‘^R’ history-incremental-search-backward

alias go=xdg-open
alias cdroot='if [ -n "`git rev-parse --show-cdup`" ]; then cd `git rev-parse --show-cdup`; fi'
alias ls='ls --color=yes'

source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

[ -s "/home/juracy/.dnx/dnvm/dnvm.sh" ] && . "/home/juracy/.dnx/dnvm/dnvm.sh" # Load dnvm
export EDITOR="vim"
export APPDATA=/home/juracy/.config
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

setopt NO_CHECK_JOBS
setopt NO_HUP

source ~/.zplugrc.zsh
source ~/.ng-completion.zsh
