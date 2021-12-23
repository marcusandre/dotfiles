CONFIG_PATH=${HOME}/.config

all:
	stow -Rv git zsh
	mkdir -p $(CONFIG_PATH)/{nvim,alacritty}
	stow -Rv --target=$(CONFIG_PATH)/nvim nvim
	stow -Rv --target=$(CONFIG_PATH)/alacritty alacritty
