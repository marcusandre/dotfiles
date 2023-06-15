CONFIG_PATH=${HOME}/.config

all: home helix nvim ranger wezterm zed

home:
	stow -v etc git ranger vim zsh

helix:
	@mkdir -p $(CONFIG_PATH)/helix
	stow -v --target=$(CONFIG_PATH)/helix helix

nvim:
	@mkdir -p $(CONFIG_PATH)/nvim
	stow -v --target=$(CONFIG_PATH)/nvim nvim

ranger:
	@mkdir -p $(CONFIG_PATH)/ranger
	stow -v --target=$(CONFIG_PATH)/ranger ranger

wezterm:
	@mkdir -p $(CONFIG_PATH)/wezterm
	stow -v --target=$(CONFIG_PATH)/wezterm wezterm

zed:
	@mkdir -p $(CONFIG_PATH)/zed
	stow -v --target=$(CONFIG_PATH)/zed zed

lint:
	stylua . -v

.PHONY: home helix nvim ranger wezterm zed lint
