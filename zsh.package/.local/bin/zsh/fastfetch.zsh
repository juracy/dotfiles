zsh_log $0 "Configuring fastfetch"

LOGO=$HOME/.logo.png
if [[ $TERM_PROGRAM != *vscode* && $POETRY_ACTIVE == "" ]]; then
    fastfetch --logo-width 40 --kitty $LOGO
fi
