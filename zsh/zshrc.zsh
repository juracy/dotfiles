if [[ "$SHELL" != *zsh* ]]; then
  SHELL=`which $0`
fi

setopt combining_chars
setopt extendedglob
setopt no_check_jobs
setopt no_hup

stty icrnl

bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"

# eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

FPATH=$HOME/.zfunc:$FPATH

autoload -Uz compinit
compinit

# Uncomment for debugging
# DOTFILES_VERBOSE=1
function zsh_log() {
  # TODO: Print with columns (pads)
  [ ! -z $DOTFILES_VERBOSE ] && printf "%-30s %s\n" "$(basename $1):" "$2..."
}

source /opt/asdf-vm/asdf.sh
# . /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.sh
# export PATH=$HOME/.asdf/installs/rust/stable/bin:$HOME/.cargo/bin:$PATH
export PATH=$HOME/.asdf/installs/rust/1.67.1/bin:$HOME/.cargo/bin:$PATH
# export PATH=$HOME/.cargo/bin:$PATH
eval "$(starship init zsh)"
eval "$(sheldon source)"

# Load Angular CLI autocompletion.
[ -x ng ] && source <(ng completion script)

# >>>> Vagrant command completion (start)
fpath=(/tmp/.mount_vagranbywsUk/usr/gembundle/gems/vagrant-2.2.19/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)

zstyle ':completion:*' menu select
fpath+=~/.zfunc

source /home/juracy/.config/broot/launcher/bash/br
