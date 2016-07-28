
# Dotfiles

Please feel free to fork or contribute.

## Components

* [Git](https://git-scm.com/)
* [Vim](http://www.vim.org/about.php)
* [Zsh](http://www.zsh.org/)

## Installation

Run the following command inside of your favourite terminal, after you read the
dependencies section.

```sh
$ git clone https://github.com/marcusandre/dotfiles.git ~/.dotfiles
$ cd $_ && make install
```

If you just want to install the **vim** configuration run:

```sh
$ stow vim
```

You can also prune all configuration files via:

```sh
$ make uninstall
```

or if you just want to prune the vim configuration run:

```sh
$ stow -D vim
```

### Dependencies

#### tl;dr

Run the following command after you install the homebrew package manager:

```sh
$ brew install git stow tmux vim zsh
```

- Homebrew
  - GNU Stow
  - Git
  - tmux
  - Vim
    - vim-plug
  - Zsh

#### GNU Stow

You should use [GNU Stow](https://www.gnu.org/software/stow/) to manage these
dotfiles with ease.

> GNU Stow is a symlink farm manager which takes distinct packages of software
> and/or data located in separate directories on the filesystem, and makes them
> appear to be installed in the same place. For example, /usr/local/bin could
> contain symlinks to files within /usr/local/stow/emacs/bin,
> /usr/local/stow/perl/bin etc., and likewise recursively for any other
> subdirectories such as .../share, .../man, and so on.

It sings in my ears.

#### vim-plug

One essential tool in my workflow is [Vim](http://www.vim.org/about.php). In
it's current stable version it lacks a default package manager. So there is
[vim-plug](https://github.com/junegunn/vim-plug) - *A minimalist Vim plugin
manager*.

##### Build

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

##### Install & Update plugins

This is what you should run in the beginning:

```
vim +PlugInstall +qall
```

Then every other time:


```
vim +PlugUpdate +qall
```

## See also

There are other great dotfiles around:

- [yoshuawuyts/dotfiles](https://github.com/yoshuawuyts/dotfiles)
- [marcusandre/dotfiles@1.0.0](https://github.com/marcusandre/dotfiles/tree/cc7938d1817798f98c670c74863eec71e27a0b2c)*

\* This is an older state I used to use for a long time

## License

MIT
