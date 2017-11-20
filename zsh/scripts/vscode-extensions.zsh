alias vscode-backup="code --list-extensions > ~/.dotfiles/vscode/extensions.lst"
alias vscode-restore="xargs -a ~/.dotfiles/vscode/extensions.lst -L1 code --install-extension"
