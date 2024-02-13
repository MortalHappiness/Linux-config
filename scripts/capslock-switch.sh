#!/usr/bin/env bash

script_name=$(basename "$0")

if ! command -v xdotool &> /dev/null
then
    notify-send "$script_name" "xdotool: command not found"
    exit 1
fi

xdotool key Caps_Lock
notify-send "$script_name" "Successfully executed"
