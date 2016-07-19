
# Dotfiles

Please feel free to fork or contribute.

## Installation

```sh
$ ./install
```

### Preparation

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

macOS users would install stow via: ```brew install stow```.

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

## See also

There are other great dotfiles around:

- [yoshuawuyts/dotfiles](https://github.com/yoshuawuyts/dotfiles)
- [marcusandre/dotfiles@1.0.0](https://github.com/marcusandre/dotfiles/tree/cc7938d1817798f98c670c74863eec71e27a0b2c)*

\* This is an older state i used to use for a long time

## License

MIT
