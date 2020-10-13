#!/bin/sh
#
# Toggle between touchpad enable/disable

touchpad="$(xinput list --name-only | grep 'Touchpad')"
state=$(xinput list-props "$touchpad" | grep 'Device Enabled' | cut -f3)

if [ "$state" == 1 ]; then
    xinput disable "$touchpad"
    notify-send -i $HOME/.config/sxhkd/images/Touchpad_Disabled.png "Touchpad Disabled"
else
    xinput enable "$touchpad"
    notify-send -i $HOME/.config/sxhkd/images/Touchpad.png "Touchpad Enabled"
fi
