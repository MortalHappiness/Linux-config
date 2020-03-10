#!/bin/sh
#
# Toggle between touchpad enable/disable

touchpad="$(xinput list --name-only | grep 'Touchpad')"
state=$(xinput list-props "$touchpad" | grep 'Device Enabled' | cut -f3)

if [ "$state" == 1 ]; then
    xinput disable "$touchpad"
    unclutter --timeout 0 &
    bash $HOME/.config/sxhkd/scripts/notify.sh "Touchpad" "Locked" 300
else
    xinput enable "$touchpad"
    pkill -x unclutter
    bash $HOME/.config/sxhkd/scripts/notify.sh "Touchpad" "Enabled" 300
fi

