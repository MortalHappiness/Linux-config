#!/bin/bash
#
# Helper functions

function help_message() {
    echo "Usage: bash setup.sh [COMMAND]"
    echo ""
    echo "Commands:"
    echo "   install [FILE]   Read symbolic links configuration in FILE and"
    echo "                    create symbolic links and move files to be"
    echo "                    overwritten to ./.backup/"
    echo "   remove           Remove all symbolic links."
    echo "   revert           Remove all symbolic links and put backup files back"
    echo "                    to original position."
}

# read configuration file
function read_conf() {
    cat $1 |
    sed 's/#.*$//g' |   # replace comments with empty string
    sed '/^$/d'         # delete empty line
}

# ==================================
# Note: format of .backup_record
# Each Line: [link] [corresponding file in .backup]
# If no file be overwritten(move to .backup), then the second field is dot(.)

function _remove() {
    if [ ! -e .backup_record ]; then
        return
    fi
    while read -a line
    do
        echo "Delete ${line[0]}"
        rm "${line[0]}"
    done < .backup_record
    rm .backup_record
}

function _install() {
    _remove
    touch .backup_record

    read_conf "$1" |
    while read -a line
    do
        # If there are files to be overwritten, move it into .backup
        backup_file='.'
        TARGET=$PWD/${line[0]}
        LINK_NAME=$HOME/${line[1]}
        if [ -e $LINK_NAME ]; then
            echo "Move $LINK_NAME into $PWD/.backup/"
            mv "$LINK_NAME" "$PWD/.backup/"
            backup_file="$PWD/.backup/${line[1]}"
        fi
        # Create necessary folder
        LINK_PARENT_FOLDER="$(dirname $LINK_NAME)"
        if [ ! -e $LINK_PARENT_FOLDER ]; then
          echo "Create folder $LINK_PARENT_FOLDER"
          mkdir -p "$LINK_PARENT_FOLDER"
        fi
        # Create link
        echo "Create link $LINK_NAME -> $TARGET"
        ln -s "$TARGET" "$LINK_NAME"
        # Write entry into .backup_record
        echo "$LINK_NAME $backup_file" >> .backup_record
    done
}

function _revert() {
    if [ ! -e .backup_record ]; then
        return
    fi
    while read -a line
    do
        echo "Delete ${line[0]}"
        rm ${line[0]}
        if [ "${line[1]}" != '.' ]; then
            echo "Move ${line[1]} to ${line[0]}"
            mv "${line[1]}" "${line[0]}"
        fi
    done < .backup_record
    rm .backup_record
}
