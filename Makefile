CONFIG_PATH=${HOME}/.config

all:
	stow -Rv etc git zsh
	mkdir -p $(CONFIG_PATH)/{alacritty,wezterm}
	stow -Rv --target=$(CONFIG_PATH)/alacritty alacritty
	stow -Rv --target=$(CONFIG_PATH)/wezterm wezterm
