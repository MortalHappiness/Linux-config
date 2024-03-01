#!/usr/bin/env bash
#
# Toggle open a desktop application
#
# Behavior:
# 1. If not open, open the application
# 2. If open and not focused, focus the application
# 3. If open and focused, close the application

SCRIPT_NAME=$(basename "$0")

################################################################################
# Check dependencies
################################################################################


if ! command -v dex > /dev/null; then
  notify-send "$SCRIPT_NAME" "dex: command not found"
  exit 1
fi

if ! command -v xdotool > /dev/null; then
  notify-send "$SCRIPT_NAME" "xdotool: command not found"
  exit 1
fi

if ! command -v wmctrl > /dev/null; then
  notify-send "$SCRIPT_NAME" "wmctrl: command not found"
  exit 1
fi

################################################################################
# Check arguments
################################################################################


if [ -z "$1" ] || [ -z "$2" ]; then
  notify-send "$SCRIPT_NAME" "Usage: $SCRIPT_NAME <app_path> <window_class>"
  exit 1
fi

APP_PATH="$1"
WINDOW_CLASS="$2"

################################################################################
# Main
################################################################################

TARGET_WINDOW=$(xdotool search --onlyvisible --class "$WINDOW_CLASS" getwindowname)
CURRENT_FOCUS=$(xdotool getwindowfocus getwindowname)

if [ -z "${TARGET_WINDOW}" ]; then
  dex "$APP_PATH"
elif [[ "$CURRENT_FOCUS" != "$TARGET_WINDOW" ]]; then
  wmctrl -a "$TARGET_WINDOW"
else
  wmctrl -c "$TARGET_WINDOW"
fi
