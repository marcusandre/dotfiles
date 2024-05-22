CONFIG_PATH=${HOME}/.config

link:
	@stow -v etc

	@mkdir -p $(HOME)/bin
	@stow -v --target=$(HOME)/bin bin

	@mkdir -p $(CONFIG_PATH)/fish
	@stow -v --target=$(CONFIG_PATH)/fish fish

	@mkdir -p $(CONFIG_PATH)/git
	@stow -v --target=$(CONFIG_PATH)/git git

	@mkdir -p $(CONFIG_PATH)/jj
	@stow -v --target=$(CONFIG_PATH)/jj jj

	@mkdir -p $(CONFIG_PATH)/helix
	@stow -v --target=$(CONFIG_PATH)/helix helix

	@mkdir -p $(CONFIG_PATH)/wezterm
	@stow -v --target=$(CONFIG_PATH)/wezterm wezterm

.PHONY: link
