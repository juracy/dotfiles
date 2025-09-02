#!/bin/bash
# Launcher apps by workspace for Hyprland

WORKSPACE=$(hyprctl activeworkspace -j | jq '.id')
WORK_CHROME="google-chrome-stable --profile-directory=\"$WORK_CHROME_PROFILE\""

case $WORKSPACE in
    1)
        hyprctl dispatch exec 'google-chrome-stable --profile-directory="Default"'
        ;;
    2)
        hyprctl dispatch exec "kitty"
        ;;
    3)
        hyprctl dispatch exec "gtk-launch dev.zed.Zed.desktop"
        ;;
    4)
        hyprctl dispatch exec "flatpak run com.rtosta.zapzap"
        ;;
    5)
        hyprctl dispatch exec "$WORK_CHROME --app-id=cifhbcnohmdccbgoicgdjpfamggdegmo"
        ;;
    6)
        hyprctl dispatch exec "$WORK_CHROME"
        ;;
    7)
        hyprctl dispatch exec 'logseq'
        ;;
    *)
        notify-send "Unknown workspace"
        ;;
esac
