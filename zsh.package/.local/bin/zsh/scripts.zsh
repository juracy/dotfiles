#!/bin/zsh

option=$(printf "VPN\nNothing" | rofi -dmenu -p 'Scripts')

case "$option" in
    "VPN") kitty --hold ~/.local/bin/vpn.sh ;;
esac
