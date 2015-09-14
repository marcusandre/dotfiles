
all: setup bin vim

setup:
	@./script/setup

bin:
	@if [ -d "~/Dropbox" ]; then rm ~/$@; fi
	ln -s $(shell pwd)/$@ ~/$@

vim:
	@./script/vim

.PHONY: vim bin
