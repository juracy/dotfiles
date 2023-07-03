#!/bin/sh

function run_or_switch {
    if ! wmctrl -x -a "$1" ; then
        shift
        $* &
    fi
}

function bosskey {
    killall -9 smplayer 2> /dev/null
    killall -9 mplayer 2> /dev/null
    killall -9 mcomix 2> /dev/null
    killall -9 mpv 2> /dev/null
    killall -9 yacreader 2> /dev/null
}

function terminology {
    if ! wmctrl -ia $(wmctrl -lx | grep -i terminology | tail -n 1 | cut -d ' ' -f1); then
        /usr/bin/terminology &
        fi
}

function spotify {
    if ! wmctrl -Fa "Spotify Premium" ; then
        /usr/sbin/spotify &
    fi
}

case "$1" in
    chrome)      run_or_switch chrome /usr/bin/google-chrome-stable;;
    firefox | browser)     run_or_switch Navigator.firefox /usr/bin/firefox ;;

    terminator)  run_or_switch terminator.Terminator /usr/bin/terminator ;;
    tilix | terminal)       run_or_switch tilix.Tilix /usr/bin/tilix ;;
    terminology) terminology ;;
    alacritty)   run_or_switch "Alacritty.Alacritty" /usr/bin/alacritty;;

    gvim)        run_or_switch gvim.Gvim /usr/bin/gvim ;;
    sublime)     run_or_switch subl3.Subl3 /usr/sbin/subl3;;
    atom)        run_or_switch atom.Atom /usr/sbin/atom;;
    vscode | editor)      run_or_switch "code.Code" /usr/sbin/code;;

    pidgin)      run_or_switch pidgin.Pidgin /usr/bin/pidgin ;;
    rambox)      run_or_switch rambox.Rambox /var/lib/snapd/snap/bin/rambox;;
    franz)       run_or_switch franz.Franz /opt/franz-bin/Franz;;
    messenger)   run_or_switch franz.Franz /opt/franz-bin/Franz;;
    telegram)    run_or_switch telegram-desktop.Telegram /usr/bin/flatpak run org.telegram.desktop;;

    nautilus)    run_or_switch nautilus /usr/bin/nautilus --no-desktop -w ;;
    spotify)     run_or_switch spotify.Spotify /usr/sbin/spotify;;
    bzr)         run_or_switch bzr.Bzr /usr/bin/bzr explorer ;;
    evince)      run_or_switch evince.Evince /usr/bin/evince;;
    vb)          run_or_switch Qt-subapplication.VirtualBox /usr/bin/VirtualBox;;
    pavucontrol) run_or_switch "pavucontrol.Pavucontrol" /usr/bin/pavucontrol;;
    bosskey)     bosskey;;
    bga)         run_or_switch crx_pogkokppkghfaeboimdkfifmcmlhngnl.Google-chrome /opt/google/chrome/google-chrome --profile-directory=Default --app-id=pogkokppkghfaeboimdkfifmcmlhngnl;;
    obsidian)    run_or_switch obsidian.obsidian /usr/bin/flatpak run md.obsidian.Obsidian;;
esac

#if "$1" -eq "nautilus"; then
#   sleep 1
#   wmctrl -x -a "$1"
#fi
