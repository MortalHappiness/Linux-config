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

if ! command -v wmctrl > /dev/null; then
  notify-send "$SCRIPT_NAME" "wmctrl: command not found"
  exit 1
fi

if ! command -v xdotool > /dev/null; then
  notify-send "$SCRIPT_NAME" "xdotool: command not found"
  exit 1
fi

################################################################################
# Check arguments
################################################################################


if [ -z "$1" ] || [ -z "$2" ]; then
  notify-send "$SCRIPT_NAME" "Usage: $SCRIPT_NAME <app_path> <window_title>"
  exit 1
fi

APP_PATH="$1"
WINDOW_TITLE_SUBSTR="$2"

################################################################################
# Main
################################################################################

CURRENT_FOCUS=$(xdotool getwindowfocus getwindowname)

if ! wmctrl -l | grep -q -F "$WINDOW_TITLE_SUBSTR"; then
  dex "$APP_PATH"
elif [[ "$CURRENT_FOCUS" != *"$WINDOW_TITLE_SUBSTR"* ]]; then
  wmctrl -a "$WINDOW_TITLE_SUBSTR"
else
  wmctrl -c "$WINDOW_TITLE_SUBSTR"
fi
