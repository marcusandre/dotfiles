DIRS=$(shell find . -type d -maxdepth 1 ! -name '.*' | cut -c 3-)

install:
	@stow --verbose $(DIRS)

uninstall:
	@stow -D --verbose $(DIRS)
