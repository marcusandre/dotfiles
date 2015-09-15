
all: setup bin vim

setup:
	@./script/setup

bin:
	ln -sf $(shell pwd)/$@ ~/$@

vim:
	@./script/vim

.PHONY: vim bin
