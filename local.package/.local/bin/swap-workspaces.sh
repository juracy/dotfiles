#!/bin/bash

# 1. Obtém os nomes dos dois monitores
MONITORS=$(hyprctl monitors -j | jq -r '.[].name')
MON1=$(echo "$MONITORS" | sed -n '1p')
MON2=$(echo "$MONITORS" | sed -n '2p')

# 2. Identifica qual monitor está focado ATUALmente
FOCUSED=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')

# 3. Executa o swap atômico (troca o conteúdo visual)
hyprctl dispatch swapactiveworkspaces "$MON1" "$MON2"

# 4. Muda o foco para o "outro" monitor
if [ "$1" == "focus" ]; then
    if [ "$FOCUSED" == "$MON1" ]; then
        hyprctl dispatch focusmonitor "$MON2"
    else
        hyprctl dispatch focusmonitor "$MON1"
    fi
fi
