CONFIG_PATH=${HOME}/.config

lint:
	stylua .

all:
	@stow -v etc vim

	@mkdir -p $(HOME)/bin
	@stow -v --target=$(HOME)/bin bin

	@mkdir -p $(CONFIG_PATH)/atuin
	@stow -v --adopt --target=$(CONFIG_PATH)/atuin atuin

	@mkdir -p $(CONFIG_PATH)/bat
	@stow -v --target=$(CONFIG_PATH)/bat bat

	@mkdir -p $(CONFIG_PATH)/fish
	@stow -v --target=$(CONFIG_PATH)/fish fish

	@mkdir -p $(CONFIG_PATH)/git
	@stow -v --target=$(CONFIG_PATH)/git git

	@mkdir -p $(CONFIG_PATH)/mise
	@stow -v --target=$(CONFIG_PATH)/mise mise

	@mkdir -p $(CONFIG_PATH)/jj
	@stow -v --target=$(CONFIG_PATH)/jj jj

	@mkdir -p $(CONFIG_PATH)/helix
	@stow -v --target=$(CONFIG_PATH)/helix helix

	@mkdir -p $(CONFIG_PATH)/nvim
	@stow -v --no-folding --target=$(CONFIG_PATH)/nvim nvim

	@mkdir -p $(CONFIG_PATH)/ripgrep
	@stow -v --target=$(CONFIG_PATH)/ripgrep ripgrep

	@mkdir -p $(HOME)/Library/Application\ Support/nushell
	@stow -v --target=$(HOME)/Library/Application\ Support/nushell nushell

	@mkdir -p $(CONFIG_PATH)/wezterm
	@stow -v --target=$(CONFIG_PATH)/wezterm wezterm

	@mkdir -p $(CONFIG_PATH)/wezterm
	@stow -v --target=$(CONFIG_PATH)/wezterm wezterm

.PHONY: all lint
