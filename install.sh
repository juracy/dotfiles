#!/bin/sh

DOTFILES="$HOME/.dotfiles"
GITCONFIG=$HOME/.gitconfig
GITCONFIG_PERSONAL=$HOME/.gitconfig-personal

link() {
  from="$DOTFILES/$1"
  to="$HOME/$2"
  echo "Linking '$from' to '$to'"
  if [ ! -L ${to} -a -e ${to} ] ; then
    mv "$to" "$to-before-dotfiles"
  else
    rm -f "$to"
  fi
  mkdir -p "$(dirname "$to")"
  ln -s "$from" "$to"
}

# personal git config
if [ ! -L ${GITCONFIG} -a -e ${GITCONFIG} ] ; then
  echo "Moving $GITCONFIG to $GITCONFIG_PERSONAL, please review it!"
  mv ${GITCONFIG} ${GITCONFIG_PERSONAL}
fi

# link files
link "ack/ackrc" ".ackrc"
link "peco/config.json" ".config/peco/config.json"
link "zsh/zshrc.zsh" ".zshrc"
link "zsh/zplugrc.zsh" ".zplugrc.zsh"
link "zsh/scripts" ".local/bin/zsh"
link "vscode/settings.json" ".config/Code/User/settings.json"
link "vscode/keybindings.json" ".config/Code/User/keybindings.json"
link "vscode/snippets" ".config/Code/User/snippets"
link "git/gitconfig" ".gitconfig"
link "htop/htoprc" ".config/htop/htoprc"
link "starship.toml" ".config/starship.toml"

# TODO: optional configs
link "dunst/config" ".config/dunst/config"
