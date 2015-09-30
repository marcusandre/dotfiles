
all: setup bin vim tmux

setup:
	@./script/setup

bin:
	test -h ~/$@ || ln -s $(shell pwd)/$@ ~/$@

vim:
	@./script/vim

tmux:
	@./script/tmux

.PHONY: vim bin tmux
