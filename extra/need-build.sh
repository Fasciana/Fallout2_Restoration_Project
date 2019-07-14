#!/bin/bash

set -xeu -o pipefail

# check if need to build

if [[ -n $TRAVIS_TAG ]]; then
  exit 0
fi

echo $TRAVIS_COMMIT_RANGE
git diff --name-only $TRAVIS_COMMIT_RANGE

if [[ "$(git diff --name-only $TRAVIS_COMMIT_RANGE | grep -qv "data\|docs\|README.md" | wc -l)" != "0" ]]; then
  exit 0
fi

exit 1