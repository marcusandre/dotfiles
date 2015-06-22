#!/bin/bash

set -e

#
# create symlinks for relevant files
#

if [[ $* == *--link* ]]; then
  # find relevant files
  files=$(find . -type f -name ".*" -exec basename {} \;)

  for file in $files; do
    echo "$HOME/$file => $(pwd)/$file"
    ln -sf $(pwd)/$file $HOME/$file
  done
fi

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
  recipes=(bash git vim wget curl cmake bash-completion git-extras the_silver_searcher ack z)
  recipes=$(printf " %s" "${recipes[@]}")
  recipes=${recipes:1}
  brew update
  brew install $recipes
  brew cleanup --force
fi

#
# install vundle
#

if [[ $* == *--vundle* ]]; then
  dir=~/.vim/bundle/Vundle.vim

  if [ ! -d "$dir" ]; then
    git clone https://github.com/gmarik/Vundle.vim.git "$dir"
    vim +PluginInstall +qall
  else
    cd "$dir" && git pull
    vim +PluginUpdate +qall
  fi
fi
