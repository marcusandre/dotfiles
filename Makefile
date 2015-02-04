
all: update link

update:
	@git pull origin master

link:
	@./bootstrap.sh --link
