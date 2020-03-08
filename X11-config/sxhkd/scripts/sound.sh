#!/bin/sh
#
# Sound control

# Unmute all
amixer set Master unmute
amixer set Speaker unmute
amixer set Headphone unmute

case "$1" in
    "mute")
        amixer set Master mute
        ;;
    "lower")
        amixer set Master unmute
        amixer set Master 5%-
        ;;
    "raise")
        amixer set Master unmute
        amixer set Master 5%+
        ;;
esac
