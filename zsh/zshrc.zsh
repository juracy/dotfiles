SHELL=`which $0`

setopt extendedglob
setopt no_check_jobs
setopt no_hup

stty icrnl

bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

autoload -Uz compinit
compinit

# Uncomment for debugging
# DOTFILES_VERBOSE=1
function zsh_log() {
  # TODO: Print with columns (pads)
  [ ! -z $DOTFILES_VERBOSE ] && print -c "$(basename $1)" "$2..."
}

eval "$(starship init zsh)"
source ~/.zplugrc.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
