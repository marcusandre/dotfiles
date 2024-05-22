# dotfiles

This repository contains my personal configuration files. My [Neovim](https://neovim.io/) configuration lives here: [marcusandre/nvim](https://github.com/marcusandre/nvim).

## Building Blocks

- [Fish](https://fishshell.com/)
- [WezTerm](https://wezfurlong.org/wezterm)
- [Git](https://git-scm.com/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Atuin](https://github.com/atuinsh/atuinb)
- [Mise](https://mise.jdx.dev/)
- and more

## Installation

```
$ brew bundle && make all # or `stow` the individual folders
```

## Keyboard (MacOS)

```sh
$ defaults write NSGlobalDomain KeyRepeat -int 1
$ defaults write NSGlobalDomain InitialKeyRepeat -int 10
```
