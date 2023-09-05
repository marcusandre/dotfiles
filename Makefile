CONFIG_PATH=${HOME}/.config

home:
	@stow -v etc vim
	@mkdir -p $(HOME)/bin
	@stow -v --target=$(HOME)/bin bin

bat:
	@mkdir -p $(CONFIG_PATH)/bat
	@stow -v --target=$(CONFIG_PATH)/bat bat

fish:
	@mkdir -p $(CONFIG_PATH)/fish
	@stow -v --target=$(CONFIG_PATH)/fish fish

git:
	@mkdir -p $(CONFIG_PATH)/git
	@stow -v --target=$(CONFIG_PATH)/git git

helix:
	@mkdir -p $(CONFIG_PATH)/helix
	@stow -v --target=$(CONFIG_PATH)/helix helix

nvim:
	@mkdir -p $(CONFIG_PATH)/nvim
	@stow -v --target=$(CONFIG_PATH) nvim

wezterm:
	@mkdir -p $(CONFIG_PATH)/wezterm
	@stow -v --target=$(CONFIG_PATH)/wezterm wezterm

zellij:
	@mkdir -p $(CONFIG_PATH)/zellij
	@stow -v --target=$(CONFIG_PATH)/zellij zellij

.PHONY: home bat fish git helix nvim wezterm zellij
