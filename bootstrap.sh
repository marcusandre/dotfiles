#!/bin/bash
# symlink all dot-files and prefix them with a dot char
for f in `pwd`/dots/*
do
  ln -sf "$f" "$HOME/.${f##*/}"
done

# install nvm
if [[ ! -d ~/.nvm ]]; then
  git clone https://github.com/creationix/nvm.git ~/.nvm
fi

# reload the profile
source ~/.bash_profile
