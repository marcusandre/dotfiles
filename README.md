# dotfiles

This repository contains my personal configuration files. My [Neovim](https://neovim.io/) configuration lives here: [marcusandre/nvim](https://github.com/marcusandre/nvim).

## Building Blocks

- [Fish](https://fishshell.com/)
- [WezTerm](https://wezfurlong.org/wezterm)
- [Git](https://git-scm.com/)
- [Zed](https://zed.dev/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Atuin](https://github.com/atuinsh/atuinb)
- [Mise](https://mise.jdx.dev/)
- [and more](https://github.com/marcusandre/dotfiles/blob/main/Brewfile)

## Installation

```bash
brew bundle && just # or `stow` the individual folders
```

## Keyboard (MacOS)

```bash
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
```
