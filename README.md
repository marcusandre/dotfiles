# dotfiles


[![neovim](https://img.shields.io/badge/neovim-v11-dev)](https://neovim.io/)

This repository contains my personal configuration files.

## Building Blocks

- [Fish](https://fishshell.com/)
- [WezTerm](https://wezfurlong.org/wezterm)
- [Neovim](https://neovim.io/)
- [Helix](https://helix-editor.com/)
- [Jujutsu (`jj`)](https://github.com/martinvonz/jj)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Mise](https://mise.jdx.dev/)
- [Just](https://github.com/casey/just)
- [Git](https://git-scm.com/)
- [and more](https://github.com/marcusandre/dotfiles/blob/main/Brewfile)

## Installation

```bash
brew bundle && just
```

### Neovim

```sh
nvim --headless "+Lazy! sync" +qa
```

## MacOS

```bash
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
```
