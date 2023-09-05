CONFIG_PATH=${HOME}/.config

all: home config

home:
	$(STOW) -v etc vim
	@mkdir -p $(HOME)/bin
	$(STOW) -v --target=$(HOME)/bin bin

config:
	@mkdir -p $(CONFIG_PATH)/bat
	$(STOW) -v --target=$(CONFIG_PATH)/bat bat
	@mkdir -p $(CONFIG_PATH)/fish
	$(STOW) -v --target=$(CONFIG_PATH)/fish fish
	@mkdir -p $(CONFIG_PATH)/git
	$(STOW) -v --target=$(CONFIG_PATH)/git git
	@mkdir -p $(CONFIG_PATH)/helix
	$(STOW) -v --target=$(CONFIG_PATH)/helix helix
	@mkdir -p $(CONFIG_PATH)/nvim
	$(STOW) -v --target=$(CONFIG_PATH) nvim
	@mkdir -p $(CONFIG_PATH)/wezterm
	$(STOW) -v --target=$(CONFIG_PATH)/wezterm wezterm
	@mkdir -p $(CONFIG_PATH)/zed
	$(STOW) -v --target=$(CONFIG_PATH)/zed zed
	@mkdir -p $(CONFIG_PATH)/zellij
	$(STOW) -v --target=$(CONFIG_PATH)/zellij zellij

.PHONY: all home config
