#!/bin/sh

dotfiles="$HOME/.dotfiles"

link() {
  from="$dotfiles/$1"
  to="$HOME/$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  mkdir -p "$(dirname "$to")"
  ln -s "$from" "$to"
}

# link files

link "peco/config.json" ".config/peco/config.json"
# link "zsh/zshrc.zsh" ".zshrc"
