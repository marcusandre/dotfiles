CONFIG_PATH=${HOME}/.config

all: config nvim wezterm

config:
	stow -v vim git etc

nvim:
	@mkdir -p $(CONFIG_PATH)/nvim
	stow -v --target=$(CONFIG_PATH)/nvim nvim

wezterm:
	@mkdir -p $(CONFIG_PATH)/wezterm
	stow -v --target=$(CONFIG_PATH)/wezterm wezterm

.PHONY: config nvim wezterm 
