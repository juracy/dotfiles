#!/usr/bin/env bash

if [ "$1" != "" ]; then
    WALLPAPER="$1"
else
    #WALLPAPER_DIR="/usr/share/backgrounds/\n$HOME/.assets/wallpapers/"
    CURRENT_WALL=$(swww query | cut -d: -f 5 | head -1 | sed -e 's/^ //')
    CURRENT_WALL_NAME=$(basename "$CURRENT_WALL")

    # Get a random wallpaper that is not the current one
    # TODO: get from env var WALLPAPER_DIR
    WALLPAPER=$(find /usr/share/backgrounds/ $HOME/.assets/wallpapers/ \
        -type f -name '*.jpg' -or -name '*.png' ! -name "$CURRENT_WALL_NAME" | shuf -n 1)
fi

if [ ! -f "$WALLPAPER" ]; then
    notify-send "Wallpaper Error" "File not found: $WALLPAPER"
    exit 1
fi

# Apply the selected wallpaper
# hyprctl hyprpaper reload ,"$WALLPAPER"
BASENAME=$(basename "$WALLPAPER")
notify-send "New wallpaper" "$BASENAME"
matugen -t scheme-fidelity --contrast 0.2 --show-colors image -v "$WALLPAPER" > /tmp/matugen.log


cat << END > ~/.config/hypr/hyprlock-background.conf
background {
    path = $WALLPAPER
    blur_passes = 0
}
END
