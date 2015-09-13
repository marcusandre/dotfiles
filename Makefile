
all: files vim

files:
	@./bin/dotfiles

vim:
	@./script/vim

.PHONY: vim
