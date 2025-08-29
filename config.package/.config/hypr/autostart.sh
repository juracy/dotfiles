# Base desktop support
dbus-update-activation-enviroment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &

# Hyprland support apps
waybar &
hypridle &
swww-daemon &
~/.local/bin/wallpaper-changer.sh &
swaync &
nm-applet --indicator &

# Clipboard control
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &

# Auth agents
/usr/lib/polkit-gnome/polkit-kde-authentication-agent-1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
