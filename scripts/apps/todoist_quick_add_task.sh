#/usr/bin/env bash

SCRIPT_NAME=$(basename "$0")

################################################################################
# Check dependencies
################################################################################


if ! command -v zenity > /dev/null; then
  notify-send "$SCRIPT_NAME" "zenity: command not found"
  exit 1
fi

if ! command -v todoist > /dev/null; then
  notify-send "$SCRIPT_NAME" "todoist: command not found"
  exit 1
fi

################################################################################
# Main
################################################################################

ITEM_CONTENT=$(zenity --entry --title="Quick Add Todoist Task" --text="Text name:" --window-icon=info --width=600)

# If user cancels, exit
if [ -z "$ITEM_CONTENT" ]; then
  exit 0
fi

todoist quick -- "${ITEM_CONTENT}"

if [ $? -eq 0 ]; then
  notify-send "Todoist task added" "$ITEM_CONTENT"
else
  notify-send "Error adding Todoist task" "$ITEM_CONTENT"
fi
