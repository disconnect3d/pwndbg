#!/bin/sh

set -ex

# Before making a release, all dev should be 'above beta/stable'
# so those steps must be done:
# NOTE: The merges might require `-X theirs`
#
# git checkout beta
# git reset --hard origin/beta
# git merge stable
# 
#
# git checkout dev
# git reset --hard origin/dev
# git merge beta
#
## Push the branches:
#
# git push beta
# git push dev

DATE=$(which gdate || which date)

git fetch --all

TAG=$($DATE '+%Y.%m.%d')

if git tag -a $TAG -m "Add release $TAG" origin/stable; then
    git push origin $TAG
fi

