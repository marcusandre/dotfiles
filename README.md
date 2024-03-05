# dotfiles

[![neovim](https://img.shields.io/badge/neovim-v10-509947)](https://neovim.io/) [![Linting and style checking](https://github.com/marcusandre/dotfiles/actions/workflows/lint.yml/badge.svg)](https://github.com/marcusandre/dotfiles/actions/workflows/lint.yml)

This repository contains my Neovim setup and other configuration files.

## Building Blocks

- [Neovim](https://neovim.io/)
- [Nushell](https://www.nushell.sh/)
- [WezTerm](https://wezfurlong.org/wezterm)
- [Git](https://git-scm.com/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Atuin](https://github.com/atuinsh/atuinb)
- [Mise](https://mise.jdx.dev/)
- and more

## Installation

```
$ brew bundle && make all # or `stow` the individual folders
$ nvim --headless "+Lazy! sync" +qa
```

## Keyboard (MacOS)

```sh
$ defaults write NSGlobalDomain KeyRepeat -int 1
$ defaults write NSGlobalDomain InitialKeyRepeat -int 10
```

## Contributing

Even if this configuration is tailored to my needs and habits, you are welcome to contribute.
