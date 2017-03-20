
# Dotfiles

These are my dotfiles - A place where I manage tools and configurations for my
day to day work. Please feel free to fork!

Components:
- [Git](https://git-scm.com/)
- [Vim](http://www.vim.org/about.php)
- [Tmux](https://tmux.github.io/)
- [Zsh](http://www.zsh.org/)

These files are very macOS-y!

## Installation

Run the following command inside of your favourite terminal:

```sh
$ git clone https://github.com/marcusandre/dotfiles.git ~/.dotfiles
$ cd $_ && brew bundle && make
```

Make sure you have the following dependencies installed:

- [Homebrew](http://brew.sh) package manager (macOS)
- [GNU Stow](https://www.gnu.org/software/stow/) symlink manager

### Tmux

If you start `tmux` for the first time, you should hit the keybord combination
`C-b I` followed by `C-b R` to install some sane terminal multiplexing
defaults.

## See also

There are other great dotfiles around:

- [yoshuawuyts/dotfiles](https://github.com/yoshuawuyts/dotfiles)

## License

MIT
