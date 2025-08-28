#!/bin/bash
# Lançador de aplicativos por workspace para Hyprland

WORKSPACE=$(hyprctl activeworkspace -j | jq '.id')

case $WORKSPACE in
    1)
        hyprctl dispatch exec "google-chrome-stable"
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
        hyprctl dispatch exec 'google-chrome-stable "--profile-directory=Profile 6" --app-id=cifhbcnohmdccbgoicgdjpfamggdegmo'
        ;;
    6)
        hyprctl dispatch exec 'google-chrome-stable --profile-directory="Profile 6"'
        ;;
    7)
        hyprctl dispatch exec 'logseq'
        ;;
    *)
        notify-send "Unknown workspace"
        ;;
esac
