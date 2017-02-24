.PHONY: all clean setup links

all: clean setup links

setup:
	@git submodule update --init --recursive
	@git submodule foreach git checkout master
	@git submodule foreach git fetch -p
	@git submodule foreach git pull origin master

clean:
	@unlink $(HOME)/.vim >/dev/null 2>&1; true
	@unlink $(HOME)/.vimrc >/dev/null 2>&1; true

links:
	@ln -sfn $(CURDIR) $(HOME)/.vim
	@ln -sfn $(CURDIR)/vimrc $(HOME)/.vimrc
