DOTFILES="$HOME/.dotfiles"

alias vscode-backup="code --list-extensions > $DOTFILES/vscode/extensions.lst"
alias vscode-restore="xargs -a $DOTFILES/vscode/extensions.lst -L1 code --install-extension"
alias vscode-clear-extensions="xargs -a $DOTFILES/vscode/extensions.lst -L1 code --uninstall-extension"
