#!/bin/sh
#
# Toggle between touchpad enable/disable

touchpad="$(xinput list --name-only | grep 'Touchpad')"
state=$(xinput list-props "$touchpad" | grep 'Device Enabled' | cut -f3)

if [ "$state" == 1 ]; then
    xinput disable "$touchpad"
else
    xinput enable "$touchpad"
fi

