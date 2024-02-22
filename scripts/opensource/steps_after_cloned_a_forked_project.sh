#!/usr/bin/env bash

set -eo pipefail

read -p "Upstream repo URL: " UPSTREAM_REPO_URL
read -p "Use the prepare-commit-msg hook in the parent folder? (y/[n]): " USE_PREPARE_COMMIT_MSG_HOOK
USE_PREPARE_COMMIT_MSG_HOOK=${USE_PREPARE_COMMIT_MSG_HOOK:-n}
read -p "Use the commit-msg hook in the parent folder to signoff messages? (y/[n]): " USE_COMMIT_MSG_HOOK
USE_COMMIT_MSG_HOOK=${USE_COMMIT_MSG_HOOK:-n}
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
  ln -s (realpath ../prepare-commit-msg) .git/hooks/prepare-commit-msg
  ln -s (realpath ../prepare-commit-msg-override.sh) .git/hooks/prepare-commit-msg-override.sh
fi

if [ $USE_COMMIT_MSG_HOOK = "y" ]; then
  ln -s (realpath ../commit-msg) .git/hooks/commit-msg
fi
