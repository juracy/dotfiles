#!/usr/bin/env bash

# WALLPAPER_DIR="$HOME/.assets/wallpapers/"
WALLPAPER_DIR="/usr/share/backgrounds/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Apply the selected wallpaper
# hyprctl hyprpaper reload ,"$WALLPAPER"
echo "Novo wallpaper: $WALLPAPER"
swww img "$WALLPAPER"
matugen image "$WALLPAPER"
