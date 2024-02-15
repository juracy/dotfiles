zsh_log $0 'Configuring tilix'

DOTFILES="$HOME/.dotfiles"

alias tilix-backup="dconf dump /com/gexperts/Tilix/ > $DOTFILES/tilix/tilix.dconf"
alias tilix-restore="dconf load /com/gexperts/Tilix/ < $DOTFILES/tilix/tilix.dconf"

# Tilix and VTE Support
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
