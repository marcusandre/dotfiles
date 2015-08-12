
# Dotfiles

  My OSX configuration files. Please feel free to fork! :)

## Usage

```bash
$ git clone https://github.com/marcusandre/dotfiles.git .dotfiles
$ cd .dotfiles && make
```

### Abstraction

#### Makefile

```bash
$ make # update repo, symlink files and setup vim.
$ make update # fetch latest dotfile release
$ make link # symlinks the dotfiles
$ make vim # install vim-plug or update packages
```

#### bootstrap.sh

  For an easier abstraction you can use the ```bootstrap.sh``` file to manage
  more dotfiles automation. Just execute the script with one the following
  flags:

##### --link

  Symlinks all relevant dotfiles into your home directory.

##### --brew

  Installs homebrew if you want to. Forget to google the ruby install command.

##### --recipes

  Installs some magic command line tools via homebrew. Feel free to extent to
  your needs. Or send me a pull request, if I should know a good tool. :)

##### --vim-plug

  The vim setup requires some plugins. With this command you are able to
  automatically install vim-plug and all the plugins from the ```.vimrc``` file.

##### --golang

  If you are a Golang fanboy, you can easily install the language and setup it's
  environment. Everything will work automatically.

## License

  MIT
