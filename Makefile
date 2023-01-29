CONFIG_PATH=${HOME}/.config

all:
	stow -Rv etc git zsh
	mkdir -p $(CONFIG_PATH)/{nvim,wezterm}
	stow -Rv --target=$(CONFIG_PATH)/nvim nvim
	stow -Rv --target=$(CONFIG_PATH)/wezterm wezterm
