CONFIG_PATH=${HOME}/.config

all: home helix nvim wezterm

home:
	stow -v etc git vim zsh

helix:
	@mkdir -p $(CONFIG_PATH)/helix
	stow -v --target=$(CONFIG_PATH)/helix helix

nvim:
	@mkdir -p $(CONFIG_PATH)/nvim
	stow -v --target=$(CONFIG_PATH)/nvim nvim

wezterm:
	@mkdir -p $(CONFIG_PATH)/wezterm
	stow -v --target=$(CONFIG_PATH)/wezterm wezterm

lint:
	stylua . -v

.PHONY: home helix nvim wezterm lint
