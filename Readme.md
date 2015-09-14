
# Dotfiles

  My OSX configuration files. Please feel free to fork! :)

## Usage

```bash
$ git clone https://github.com/marcusandre/dotfiles.git ~/.dotfiles
$ cd .dotfiles && make
```

## Parts

### Abstraction

```bash
$ make       # update repo, symlink files and setup vim
$ make setup # update repo, symlink files
$ make vim   # install vim files
```

### Scripts

  There are a bunch of scripts you can find in the ```script``` directory. They
  are used to setup the rest of the bits and pieces to get the installation
  right.

  * **setup** - dotfiles handling (basically ```make setup```)
  * **vim** - setup vim and it's plugins (basically ```make vim```)
  * **golang** - clone and install Golang v.1.4.2

## License

  MIT
