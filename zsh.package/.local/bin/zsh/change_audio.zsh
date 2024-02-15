#!/bin/sh
type zsh_log &> /dev/null && zsh_log $0 'Configuring change_audio'

function change_audio() {
    sink=$(pactl list short sinks | grep -i "$1" | cut -f1 | head -1)
    echo "Setting default sink to: $sink";
    pacmd set-default-sink $sink
    pacmd list-sink-inputs | grep index | while read line
    do
        input=$(echo $line | cut -f2 -d' ')
        echo "Moving input: $input to sink: $sink"
        pacmd move-sink-input $input $sink
    done
}

function list_audio_outputs() {
    pactl list short sinks
}

# Fallback to use as a script
if [ ! -z "$1" ]; then
    change_audio $1
fi;
