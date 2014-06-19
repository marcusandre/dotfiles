#!/bin/bash

set -e

# no mac, no dotfiles!
[ $(uname -s) != "Darwin" ] && return

# install homebrew, if we are on a mac
if [ "$(uname -s)" == "Darwin" ]; then
  if test ! $(which brew); then
    echo "This is a Mac! Let's install homebrew..."
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  fi

  # A much faster keyboard experience
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
  defaults write NSGlobalDomain KeyRepeat -int 0.02
  defaults write NSGlobalDomain InitialKeyRepeat -int 12
fi

# symlink all dot-files and prefix them with a dot char
for f in `pwd`/dots/*
do
  ln -sf "$f" "$HOME/.${f##*/}"
done

# (opt) create vimbackup
if [[ ! -d ~/.vimbackup ]]; then
  mkdir -p ~/.vimbackup
fi

# (opt) install vundle
if [[ ! -d ~/.vim/bundle/vundle ]]; then
  mkdir -p ~/.vim/bundle/vundle
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

# reload the profile
source ~/.bash_profile

# install vundles
vim +BundleInstall +qall
