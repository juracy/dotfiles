#!/usr/bin/env bash

SAVE_DIR="$HOME/Pictures/Screenshots"
FILE_NAME="screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"
FULL_PATH="$SAVE_DIR/$FILE_NAME"

mkdir -p "$SAVE_DIR"

# 'slurp' seleciona a área, 'grim' captura e envia direto para o satty
REGION=$(slurp)

# Se o usuário apertar ESC, cancela sem mudar workspace
if [ -n "$REGION" ]; then
    grim -g "$REGION" - | satty -f - \
        --early-exit \
        --save-after-copy \
        --copy-command "wl-copy" \
        --action-on-enter save-to-clipboard \
        -o "$FULL_PATH"
fi
