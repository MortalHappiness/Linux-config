#!/usr/bin/env bash

script_name=$(basename "$0")

xmodmap ~/.Xmodmap
xcape -e 'Mode_switch=Escape' -t 250
notify-send "$script_name" "Successfully executed"
