
all: update link vim

update:
	@git pull origin master

link:
	@./bootstrap.sh --link

vim:
	@./bootstrap.sh --vundle
