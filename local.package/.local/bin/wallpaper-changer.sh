#!/usr/bin/env bash

CURRENT_WALLPAPER_FILE=$HOME/.cache/current-wallpaper
#WALLPAPER_DIR="/usr/share/backgrounds/\n$HOME/.assets/wallpapers/"
CURRENT_WALL=$(cat $CURRENT_WALLPAPER_FILE)
CURRENT_WALL_NAME=$(basename "$CURRENT_WALL")

# Get a random wallpaper that is not the current one
# TODO: get from env var WALLPAPER_DIR
WALLPAPER=$(find /usr/share/backgrounds/ $HOME/.assets/wallpapers/ -type f -name '*.jpg' -or -name '*.png' ! -name "$CURRENT_WALL_NAME" | shuf -n 1)

# Apply the selected wallpaper
# hyprctl hyprpaper reload ,"$WALLPAPER"
notify-send "New wallpaper" "$(basename $WALLPAPER)"
echo $WALLPAPER > $CURRENT_WALLPAPER_FILE
swww img "$WALLPAPER"
matugen image "$WALLPAPER"
