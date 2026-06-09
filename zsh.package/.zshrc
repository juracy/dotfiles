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
  fpath+=$(brew --prefix)/share/zsh/site-functions
fi

# Uncomment for debugging
# DOTFILES_VERBOSE=1
function zsh_log() {
  # TODO: Print with columns (pads)
  [ ! -z $DOTFILES_VERBOSE ] && printf "%-30s %s\n" "$(basename $1):" "$2..."
}

eval "$(mise activate zsh)"

zstyle ':completion:*' menu select

fpath+=~/.zfunc
fpath=(~/.local/share/zsh/completions $fpath)

# last config fort zsh
autoload -Uz compinit
compinit

# auto completes
eval "$(starship init zsh)"
eval "$(sheldon source)"
command -v ng >/dev/null && source <(ng completion script)

# last zsh thing
compinit


# Added by Antigravity CLI installer
export PATH="/home/juracy/.local/bin:$PATH"
