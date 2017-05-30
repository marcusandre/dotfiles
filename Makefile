STOW ?= stow
DIRS ?= bash etc fish git nvim readline scripts tmux vim

links:
	@$(STOW) -v -R $(DIRS)

fzf: ~/.fzf.bash

~/.fzf.bash:
	/usr/local/opt/fzf/install --key-bindings --completion --no-update-rc
