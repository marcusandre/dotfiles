#!/bin/bash

set -e

#
# skip if we're nor running a mac
#

[$(uname -s) != "Darwin"] && return

#
# find relevant files
#

files=$(find . -type f -maxdepth 1 -not -name "*.md" -not -name "bootstrap.sh" -exec basename {} \;)

for file in $files; do
  echo "$HOME/$file => $(pwd)/$file"
  ln -sf $(pwd)/$file $HOME/$file
done
