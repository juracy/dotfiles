DOTFILES="$HOME/.dotfiles"

alias tilix-backup="dconf dump /com/gexperts/Tilix/ > $DOTFILES/tilix/tilix.dconf"
alias tilix-restore="dconf load /com/gexperts/Tilix/ < $DOTFILES/tilix/tilix.dconf"
