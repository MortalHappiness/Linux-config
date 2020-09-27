#!/bin/sh

source helper.sh

if [ "$#" != "1" ]; then
    help_message
    exit 0
fi

if [ ! -e .backup ]; then
    mkdir .backup
fi

case "$1" in
    "install")
        _install
        ;;
    "remove")
        _remove
        ;;
    "revert")
        _revert
        ;;
    *)
        help_message
        ;;
esac

