STOW ?= stow
DIRS ?= etc fish git nvim scripts tmux vim zsh

install:
	@$(STOW) -Rv $(DIRS)

uninstall:
	@$(STOW) -Dv $(DIRS)
