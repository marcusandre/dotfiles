#!/usr/bin/env bash

set -e

PACKAGES=(
  bash
  git
  git-extras
  jq
  ripgrep
  stow
  trash
  tree
  vim
  z
  zsh
)

FOLDERS=(
  bin
  etc
  git
  tmux
  vim
  zsh
)

install_packages() {
  brew install ${PACKAGES[@]}
}

install_homebrew() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

main() {
  echo ""
  echo "Install packages: ${PACKAGES[@]}"

  # install homebrew if it's missing
  if ! hash brew 2>/dev/null; then
    install_homebrew
  fi

  # install needed packages
  install_packages

  echo ""
  echo "Link folders: ${FOLDERS[@]}"
  stow ${FOLDERS[@]}

  echo ""
  echo "Now switch to your prefered shell with the following command:"
  echo ""
  echo "  $ chsh -s \$(brew --prefix)/bin/zsh"
  echo ""
}

main
