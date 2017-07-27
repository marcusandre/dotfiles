STOW ?= stow
DIRS ?= etc fish git nvim scripts tmux vim zsh

links:
	@$(STOW) -Rv $(DIRS)
