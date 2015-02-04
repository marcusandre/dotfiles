#!/bin/bash

set -e

#
# skip if we're not running a mac
#

[ $(uname -s) != "Darwin" ] && return

#
# find relevant files
#

files=$(find . -type f -maxdepth 1 -not -name "*.md" -not -name "bootstrap.sh" -exec basename {} \;)

#
# create symlinks for relevant files
#

for file in $files; do
  echo "$HOME/$file => $(pwd)/$file"
  ln -sf $(pwd)/$file $HOME/$file
done

#
# install homebrew
#

if [[ $* == *--brew* ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#
# install homebrew recipes
#

if [[ $* == *--recipes* ]]; then
  recipes=(bash git vim wget curl bash-completion git-extras)
  recipes=$(printf " %s" "${recipes[@]}")
  recipes=${recipes:1}
  brew update
  brew install $recipes
  brew cleanup --force
fi
