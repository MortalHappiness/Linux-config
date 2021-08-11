#!/bin/sh
#
# Take screen shot

SAVE_FOLDER=$HOME/Screenshot/

if [ ! -e $SAVE_FOLDER ]; then
    mkdir $SAVE_FOLDER
fi

FILENAME=$(date +%Y-%m-%d_%H-%M-%S.png)
scrot $FILENAME
mv $FILENAME $SAVE_FOLDER

bash $HOME/.config/sxhkd/scripts/notify.sh \
    Screenshot "Save to $SAVE_FOLDER" 1000
