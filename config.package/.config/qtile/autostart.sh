#!/bin/sh

setxkbmap -layout "br" -model pc105 -option "grp:menu_toggle,compose:sclk" &
notify-send -u low 'Autostart' &

# TODO: Preciso detectar se estou na dataprev ou em casa
# xrandr --output DP-0 --primary --mode 1920x1080 --pos 1080x200 --rotate normal --left-of HDMI-0 --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate left &
# xrandr --output DP-0 --primary --mode 1920x1080 --pos 1080x200 --rotate normal --right-of HDMI-0 --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate left &
nitrogen --restore &
