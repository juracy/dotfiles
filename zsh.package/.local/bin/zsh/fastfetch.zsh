zsh_log $0 "Configuring fastfetch"

LOGO=$HOME/.assets/logo.png
if [[ $TERM_PROGRAM != *vscode* && $TERM_PROGRAM != *zed* && $POETRY_ACTIVE == "" ]]; then
    fastfetch --key-width 20 --logo-width 30 --logo-padding-top 5 --kitty $LOGO
fi
