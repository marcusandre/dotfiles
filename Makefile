STOW ?= stow
DIRS ?= bash etc git readline scripts tmux vim zsh

links:
	@$(STOW) -v -R $(DIRS)

fzf: ~/.fzf.bash

~/.fzf.bash:
	/usr/local/opt/fzf/install --key-bindings --completion --no-update-rc
