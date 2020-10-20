#!/bin/bash
#
# Toggle between touchpad enable/disable

touchpad="$(xinput list --name-only | grep 'Touchpad')"
state=$(xinput list-props "$touchpad" | grep 'Device Enabled' | cut -f3)

if [ "$state" == 1 ]; then
    xinput disable "$touchpad"
    notify-send -i $HOME/utils/images/Touchpad_Disabled.png "Touchpad" "Touchpad Disabled"
else
    xinput enable "$touchpad"
    notify-send -i $HOME/utils/images/Touchpad.png "Touchpad" "Touchpad Enabled"
fi
