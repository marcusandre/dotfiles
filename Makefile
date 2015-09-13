
all: setup bin vim

setup:
	@./script/setup

bin:
	rm ~/$@ && ln -s $(shell pwd)/$@ ~/$@

vim:
	@./script/vim

.PHONY: vim bin
