
all: setup bin vim tmux

setup:
	@./script/setup

bin:
	ln -sf $(shell pwd)/$@ ~/$@

vim:
	@./script/vim

tmux:
	@./script/tmux

.PHONY: vim bin tmux
