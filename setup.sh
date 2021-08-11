#!/bin/bash

source helper.sh

if [ "$#" != "1" ] && [ "$#" != "2" ]; then
    help_message
    exit 0
fi

if [ ! -e .backup ]; then
    mkdir .backup
fi

case "$1" in
    "install")
        if [ "$#" != "2" ]; then
            help_message
            exit 0
        fi
        _install "$2"
        ;;
    "remove")
        if [ "$#" != "1" ]; then
            help_message
            exit 0
        fi
        _remove
        ;;
    "revert")
        if [ "$#" != "1" ]; then
            help_message
            exit 0
        fi
        _revert
        ;;
    *)
        help_message
        ;;
esac
