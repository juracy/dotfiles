#!/bin/sh

# Setting keyboard layout
setxkbmap -layout "br" -model pc105 -option "grp:menu_toggle,compose:sclk" &

# Setting numlock on
numlockx on &

# Setting middle button replacements
xinput set-button-map 'Gaming Mouse' 1 2 3 4 5 6 7 2 2 &

# Applet for networking (NetworkManager)
nm-applet --indicator &

# Applet for mixer (PulseAudio)
pnmixer &

/usr/lib/gsd-xsettings &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &

# Setting ACPI locking events
xss-lock -- i3lock -n -i $HOME/.assets/sunset.png &

# Restarting pulseaudio
pulseaudio -k &

# Starting IBus (input manager)
# ibus-daemon -drxR
# Parece que não só piorou com o zed mais novo, como também não é mais necessário

# Notification
notify-send -u low 'Autostart (once)' &

# Starting picom (compositor)
picom &
