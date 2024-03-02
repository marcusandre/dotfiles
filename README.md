# dotfiles

[![neovim](https://img.shields.io/badge/neovim-v10-509947)](https://neovim.io/) [![Linting and style checking](https://github.com/marcusandre/dotfiles/actions/workflows/lint.yml/badge.svg)](https://github.com/marcusandre/dotfiles/actions/workflows/lint.yml)

This repository contains my Neovim setup and other configuration files.

## Installation

```
$ brew bundle && make all
$ nvim --headless "+Lazy! sync" +qa
```

## Keyboard

```sh
$ defaults write NSGlobalDomain KeyRepeat -int 1
$ defaults write NSGlobalDomain InitialKeyRepeat -int 10
```

## Contributing

Even if this configuration is tailored to my needs and habits, you are welcome to contribute.
