#!/usr/bin/env bash

# Ref: https://gist.github.com/ig0rsky/fef7f785b940d13b52eb1b379bd7438d

function log () {
    printf "%s %s\n" "->" "$1"
}

log "Updating all asdf-plugin remotes..."

asdf plugin update --all

log "Updating each plugin reference to the latest revision..."

# TODO: Maybe refactor this shit, ew.
cat ~/.tool-versions \
| awk '{print $1}' \
| xargs -I {} bash -c 'echo {} $(asdf latest {})' > ~/.tool-versions.new; \
cp ~/.tool-versions ~/.tool-versions.bk; \
mv ~/.tool-versions.new ~/.tool-versions

log "Old revision versions:"
cat ~/.tool-versions.bk
log "New revision versions:"
cat ~/.tool-versions

while true; do
    read -p "Do you wish to install all new revisions?" yn
    case $yn in
        [Yy]* ) asdf install; break;;
        [Nn]* ) exit;;
        * ) log "Please answer Yes or No.";;
    esac
done

log "Done, bye! 👋"

