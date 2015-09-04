#!/usr/bin/env bash

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
  recipes=(bash git wget curl cmake bash-completion ctags coreutils findutils)
  recipes+=(git-extras the_silver_searcher ack z jq tmux)
  recipes=$(printf " %s" "${recipes[@]}")
  recipes=${recipes:1}
  brew tap neovim/neovim
  brew update
  brew install $recipes
  brew install vim --with-lua --with-luajit --with-python3
  brew install --HEAD neovim
  brew cleanup --force
fi

#
# install/update vim bundles
#

if [[ $* == *--vim* ]]; then
  url=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  if [ ! -d "$dir" ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs $url
    ln -sf ~/.vim ~/.nvim
    vim +PlugInstall +qall now
    cd ~/.vim/plugged/tern_for_vim && npm install -s
  else
    vim +PlugUpgrade +PlugClean +PlugInstall +PlugUpdate +qall
  fi
fi

#
# Install Golang
#


if [[ $* == *--golang* ]]; then
  dir=~/.go

  if [ ! -d "$dir" ]; then
    git clone https://github.com/golang/go.git "$dir"
    cd $dir/src && git checkout go1.4.2 && ./all.bash
  else
    echo "Golang seems to be already installed."
  fi
fi
