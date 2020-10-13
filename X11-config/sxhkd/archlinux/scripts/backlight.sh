#!/bin/sh
#
# Sound control


case "$1" in
    "down")
        brightnessctl set 5%-
        brightness=$(( $(brightnessctl get)*100/$(brightnessctl max) ))%
        bash $HOME/.config/sxhkd/scripts/notify.sh "Backlight" $brightness 300
        ;;
    "up")
        brightnessctl set +5%
        brightness=$(( $(brightnessctl get)*100/$(brightnessctl max) ))%
        bash $HOME/.config/sxhkd/scripts/notify.sh "Backlight" $brightness 300
        ;;
esac
