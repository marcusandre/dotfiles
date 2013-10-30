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

# install vundle
if [[ ! -d ~/.vim/bundle/vundle ]]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

if [[ ! -d ~/bin ]]; then
  mkdir ~/bin
fi

# install z
if [[ ! -f ~/bin/z ]]; then
  wget https://raw.github.com/rupa/z/master/z.sh -O ~/bin/z
  chmod +x ~/bin/z
fi

# install watch
if [[ ! -f ~/bin/watch ]]; then
  git clone https://github.com/visionmedia/watch.git /tmp/watch && cd /tmp/watch
  PREFIX=~ make install
fi

# reload the profile
source ~/.bash_profile
