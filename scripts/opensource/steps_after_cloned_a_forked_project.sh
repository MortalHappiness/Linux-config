#!/usr/bin/env bash

set -eo pipefail

read -p "Upstream repo URL: " UPSTREAM_REPO_URL
read -p "Use the prepare-commit-msg hook in the parent folder? (y/[n]): " USE_PREPARE_COMMIT_MSG_HOOK
USE_PREPARE_COMMIT_MSG_HOOK=${USE_PREPARE_COMMIT_MSG_HOOK:-n}
read -p "Use the commit-msg hook in the parent folder to signoff messages? (y/[n]): " USE_COMMIT_MSG_HOOK
USE_COMMIT_MSG_HOOK=${USE_COMMIT_MSG_HOOK:-n}
# If the "gh" command does not exist, print a warning message to ask the user
# whether to proceed
if ! command -v gh &> /dev/null; then
  read -p "The 'gh' command does not exist. Proceed anyway? (y/[n]): " PROCEED
  if [ $PROCEED != "y" ]; then
    exit 1
  fi
fi
echo

git remote add upstream $UPSTREAM_REPO_URL
git remote set-url --push upstream no_push

echo "Fetching upstream..."
git fetch upstream

UPSTREAM_DEFAULT_BRANCH=$(git remote show upstream | grep "HEAD branch" | awk '{print $NF}')
echo "The default branch of the upstream repo is $UPSTREAM_DEFAULT_BRANCH"

git checkout -b upstream-$UPSTREAM_DEFAULT_BRANCH upstream/$UPSTREAM_DEFAULT_BRANCH
git checkout -b spike/test refs/heads/upstream-$UPSTREAM_DEFAULT_BRANCH

if [ $USE_PREPARE_COMMIT_MSG_HOOK = "y" ]; then
  ln -s $(realpath ../prepare-commit-msg-override.sh) .git/hooks/prepare-commit-msg-override.sh
  ln -s $(realpath ../prepare-commit-msg) .git/hooks/prepare-commit-msg
fi

if [ $USE_COMMIT_MSG_HOOK = "y" ]; then
  ln -s $(realpath ../commit-msg) .git/hooks/commit-msg
fi

if command -v gh &> /dev/null; then
  gh repo set-default $UPSTREAM_REPO_URL
fi
