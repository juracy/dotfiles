#!/bin/sh

setxkbmap -layout "br" -model pc105 -option "grp:menu_toggle,compose:sclk" &
nm-applet --indicator &
pnmixer &
numlockx on &
/usr/lib/gsd-xsettings &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &
xfce4-power-manager &
pulseaudio -k &
notify-send 'Autostart (once)' &
