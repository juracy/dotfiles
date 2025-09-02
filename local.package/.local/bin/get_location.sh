#!/bin/sh

LIST_SSID=$(nmcli --get-value SSID dev wifi | sort | uniq)
LOCATION=other

if [ ! -z "$SSID_WORK" ]; then
    echo $LIST_SSID | grep "$SSID_WORK" > /dev/null && LOCATION=work
fi

if [ ! -z "$SSID_HOME" ]; then
    echo $LIST_SSID | grep "$SSID_HOME" > /dev/null && LOCATION=home
fi

echo $LOCATION
