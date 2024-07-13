import os

home = os.path.expanduser('~')
google_chrome_apps = {
    'teams': 'cifhbcnohmdccbgoicgdjpfamggdegmo',
    'bga': 'pogkokppkghfaeboimdkfifmcmlhngnl',
}

background = f'{home}/.assets/sunset.png'
apps = {
    'rofi': 'rofi -combi-modi window,drun -show combi -modi combi',
    'lock': f'i3lock -n --image {background}',
    'suspend': f'notify-send -u low "suspending..." && i3lock --image {background} && sleep 2 && systemctl suspend -i',
    'screenshot': 'flameshot gui',
    'media_play': 'playerctl play-pause && notify-send -u low "Play/pause" -t 1000',
    'media_next': 'playerctl next',
    'media_prev': 'playerctl previous',
    'volume_mute': 'pamixer -t',
    'volume_up': 'pamixer -u -i 5',
    'volume_down': 'pamixer -u -d 5',
    'terminal': 'kitty',
    'browser': 'google-chrome-stable',
    'editor': 'code',
    'teams': f'google-chrome-stable "--profile-directory=Profile 6" --app-id={google_chrome_apps["teams"]}',
    'whatsapp': 'flatpak run io.github.mimbrero.WhatsAppDesktop',
    'files': 'nautilus',
    'bga': f'google-chrome-stable --profile-directory=Default --app-id={google_chrome_apps["bga"]}',
    'mixer': 'pavucontrol',
    'kbcfg': 'setxkbmap -layout "br" -model pc105 -option "grp:menu_toggle,compose:sclk"',
    'wifi_on': 'nmcli radio wifi on',
    'wifi_off': 'nmcli radio wifi off',
    'calc': 'gnome-calculator',
    'logseq': 'logseq',
    'layout': f'{home}/.local/bin/layout_setup.sh auto',
    'layout-right-wide': f'{home}/.local/bin/layout_setup.sh right-wide',
}

preferred_apps = {
    '1': apps['browser'],
    '2': apps['terminal'],
    '3': apps['editor'],
    '4': apps['whatsapp'],
    '5': apps['teams'],
    '7': apps['logseq'],
    '8': apps['bga'],
}
