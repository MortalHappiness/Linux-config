#!/usr/bin/env bash

set -eo pipefail

git init
echo '*' > .gitignore
ln -s $(realpath ~/scripts/git-hooks/prepare-commit-msg) prepare-commit-msg
ln -s $(realpath ~/scripts/git-hooks/commit-msg) commit-msg
touch prepare-commit-msg-override.sh
