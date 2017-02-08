
STOW ?= stow
DIRS ?= bash etc git readline tmux scripts vim

all: links vim fzf

links:
	@$(STOW) -v -R $(DIRS)

vim: ~/.vim/autoload/plug.vim vim-plugins

vim-plugins:
	@vim +PlugUpdate +qall

~/.vim/autoload/plug.vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

fzf: ~/.fzf.bash

~/.fzf.bash:
	/usr/local/opt/fzf/install --key-bindings --completion --no-update-rc
