#/usr/bin/env bash

SCRIPT_NAME=$(basename "$0")

################################################################################
# Variables
################################################################################

CLICKUP_API_TOKEN_1PASSWORD_REF='op://Personal/ClickUp/API Token'
CLICKUP_LIST_ID='901800824924'
CLICKUP_USER_ID='72798857'

################################################################################
# Check dependencies
################################################################################


if ! command -v zenity > /dev/null; then
  notify-send "$SCRIPT_NAME" "zenity: command not found"
  exit 1
fi

if ! command -v jq > /dev/null; then
  notify-send "$SCRIPT_NAME" "jq: command not found"
  exit 1
fi

if ! command -v op > /dev/null; then
  notify-send "$SCRIPT_NAME" "op: command not found"
  exit 1
fi

################################################################################
# Main
################################################################################

TASK_NAME=$(zenity --entry --title="ClickUp Add Task to GTD List" --text="Task Name:" --window-icon=info --width=800)

# If user cancels, exit
if [ -z "$TASK_NAME" ]; then
  exit 0
fi

API_TOKEN=$(op read "${CLICKUP_API_TOKEN_1PASSWORD_REF}")
REQUEST_BODY=$(jq -n --arg name "${TASK_NAME}" --arg assignees "${CLICKUP_USER_ID}" '{name: $name, assignees: [$assignees]}')

curl -f -i -X POST \
  "https://api.clickup.com/api/v2/list/${CLICKUP_LIST_ID}/task" \
  -H "Authorization: ${API_TOKEN}" \
  -H 'Content-Type: application/json' \
  -d "${REQUEST_BODY}"

if [ $? -ne 0 ]; then
  notify-send "$SCRIPT_NAME" "Error adding ClickUp task: $TASK_NAME"
  exit 1
fi
