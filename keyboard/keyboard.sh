#!/usr/bin/env bash

xmodmap ~/.Xmodmap
xcape -e 'Mode_switch=Escape' -t 250
notify-send "keyboard.sh" "Successfully executed"
