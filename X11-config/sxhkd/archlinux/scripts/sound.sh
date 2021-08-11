#!/bin/sh
#
# Sound control


case "$1" in
    "mute")
        amixer set Master mute
        bash $HOME/.config/sxhkd/scripts/notify.sh "Volume" "Muted" 300
        ;;
    "lower")
        amixer set Master unmute
        amixer set Master 5%-
        volume=$(amixer get Master | tail -n 1 | awk '{print $4}')
        bash $HOME/.config/sxhkd/scripts/notify.sh "Volume" $volume 300
        ;;
    "raise")
        amixer set Master unmute
        amixer set Master 5%+
        volume=$(amixer get Master | tail -n 1 | awk '{print $4}')
        bash $HOME/.config/sxhkd/scripts/notify.sh "Volume" $volume 300
        ;;
esac
