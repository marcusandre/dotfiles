CONFIG_PATH=${HOME}/.config

all: home nvim wezterm

home:
	stow -v etc git vim zsh

nvim:
	@mkdir -p $(CONFIG_PATH)/nvim
	stow -v --target=$(CONFIG_PATH)/nvim nvim

wezterm:
	@mkdir -p $(CONFIG_PATH)/wezterm
	stow -v --target=$(CONFIG_PATH)/wezterm wezterm

.PHONY: home nvim wezterm 
