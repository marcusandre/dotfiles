#!/usr/bin/env bash

set -e

PACKAGES=(
  bash
  diff-so-fancy
  fd
  fzf
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

panic_homebrew() {
  echo "Please install homebrew before running this script"
  exit 1
}

main() {
  echo ""
  echo "Install packages: ${PACKAGES[@]}"

  # install homebrew if it's missing
  if ! hash brew 2>/dev/null; then
    panic_homebrew
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
