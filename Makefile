
STOW ?= stow

all: link vim

link:
	@$(STOW) -v bash
	@$(STOW) -v etc
	@$(STOW) -v git
	@$(STOW) -v readline
	@$(STOW) -v tmux
	@$(STOW) -v vim

unlink:
	@$(STOW) -v -D bash
	@$(STOW) -v -D etc
	@$(STOW) -v -D git
	@$(STOW) -v -D readline
	@$(STOW) -v -D tmux
	@$(STOW) -v -D vim

vim: ~/.vim/autoload/plug.vim plugins

plugins:
	@vim +PlugInstall +qall

~/.vim/autoload/plug.vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
