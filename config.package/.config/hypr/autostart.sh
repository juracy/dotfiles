#!/bin/bash

# Base desktop support
dbus-update-activation-enviroment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &

# Hyprland support apps
dms run &
hypridle &
swww-daemon &
~/.local/bin/wallpaper-changer.sh &
nm-applet --indicator &

# Clipboard control
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &

# Auth agents
systemctl --user start hyprpolkitagent
# /usr/lib/polkit-gnome/polkit-kde-authentication-agent-1 &
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# HyprCursor
hyprctl setcursor $HYPRCURSOR_THEME $HYPRCURSOR_SIZE
