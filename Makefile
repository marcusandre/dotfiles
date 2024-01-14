CONFIG_PATH=${HOME}/.config

lint:
	stylua .

all:
	@stow -v etc vim
	@mkdir -p $(HOME)/bin
	@stow -v --target=$(HOME)/bin bin

	@mkdir -p $(CONFIG_PATH)/bat
	@stow -v --target=$(CONFIG_PATH)/bat bat

	@mkdir -p $(CONFIG_PATH)/btop
	@stow -v --target=$(CONFIG_PATH)/btop btop

	@mkdir -p $(CONFIG_PATH)/fish
	@stow -v --target=$(CONFIG_PATH)/fish fish

	@mkdir -p $(CONFIG_PATH)/git
	@stow -v --target=$(CONFIG_PATH)/git git

	@mkdir -p $(CONFIG_PATH)/helix
	@stow -v --target=$(CONFIG_PATH)/helix helix

	@mkdir -p $(CONFIG_PATH)/ripgrep
	@stow -v --target=$(CONFIG_PATH)/ripgrep ripgrep

	@mkdir -p $(CONFIG_PATH)/starship
	@stow -v --target=$(CONFIG_PATH)/starship starship

	@mkdir -p $(CONFIG_PATH)/wezterm
	@stow -v --target=$(CONFIG_PATH)/wezterm wezterm

.PHONY: all lint
