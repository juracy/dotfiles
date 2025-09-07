#!/usr/bin/env bash

#WALLPAPER_DIR="/usr/share/backgrounds/\n$HOME/.assets/wallpapers/"
CURRENT_WALL=$(swww query | cut -d: -f 5 | head -1 | sed -e 's/^ //')
CURRENT_WALL_NAME=$(basename "$CURRENT_WALL")

# Get a random wallpaper that is not the current one
# TODO: get from env var WALLPAPER_DIR
WALLPAPER=$(find /usr/share/backgrounds/ $HOME/.assets/wallpapers/ -type f -name '*.jpg' -or -name '*.png' ! -name "$CURRENT_WALL_NAME" | shuf -n 1)

# Apply the selected wallpaper
# hyprctl hyprpaper reload ,"$WALLPAPER"
notify-send "New wallpaper" "$(basename $WALLPAPER)"
matugen -t scheme-fidelity --contrast 0.2 --show-colors image -v "$WALLPAPER" > /tmp/matugen.log
