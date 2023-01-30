CONFIG_PATH=${HOME}/.config

all: nvim

nvim:
	@mkdir -p $(CONFIG_PATH)/nvim
	stow -v --target=$(CONFIG_PATH)/nvim nvim

.PHONY: nvim
