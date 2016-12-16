
STOW ?= stow

all: link vim fzf

link:
	@$(STOW) -v bash etc git readline tmux vim
	@$(STOW) -v config -t ~/.config

unlink:
	@$(STOW) -v -D bash etc git readline tmux vim
	@$(STOW) -v -D config -t ~/.config

vim: ~/.vim/autoload/plug.vim plugins

plugins:
	@vim +PlugUpdate +qall

~/.vim/autoload/plug.vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

fzf: ~/.fzf.bash

~/.fzf.bash:
	/usr/local/opt/fzf/install --key-bindings --completion --no-update-rc
