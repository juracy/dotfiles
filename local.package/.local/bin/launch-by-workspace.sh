#!/bin/bash
# Launcher apps by workspace for Hyprland

WORKSPACE=$(hyprctl activeworkspace -j | jq '.id')
PERSONAL_CHROME="google-chrome-stable --profile-directory=Default"
WORK_CHROME="google-chrome-stable --profile-directory=\"$WORK_CHROME_PROFILE\""
TEAM_CHROME_APP_ID="cifhbcnohmdccbgoicgdjpfamggdegmo"
WHATSAPP_CHROME_APP_ID="hnpfjngllnobngcgfapefoaidbinmjnm"

case $WORKSPACE in
    1)
        hyprctl dispatch "hl.dsp.exec_cmd('$PERSONAL_CHROME')"
        ;;
    2)
        hyprctl dispatch 'hl.dsp.exec_cmd("kitty")'
        ;;
    3)
        hyprctl dispatch 'hl.dsp.exec_cmd("gtk-launch dev.zed.Zed")'
        ;;
    4)
        hyprctl dispatch "hl.dsp.exec_cmd('$PERSONAL_CHROME --app-id=$WHATSAPP_CHROME_APP_ID')"
        ;;
    5)
        hyprctl dispatch "hl.dsp.exec_cmd('$WORK_CHROME --app-id=$TEAM_CHROME_APP_ID')"
        ;;
    6)
        hyprctl dispatch "hl.dsp.exec_cmd('$WORK_CHROME')"
        ;;
    7)
        hyprctl dispatch 'hl.dsp.exec_cmd("gtk-launch logseq")'
        ;;
    *)
        notify-send "Unknown workspace"
        ;;
esac
