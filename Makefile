.PHONY: all clean setup links

all: clean setup links

setup:
	@git clone git@github.com:fatih/vim-go bundle/golang
	@git clone git@github.com:Yggdroot/indentLine bundle/indent
	@git clone git@github.com:morhetz/gruvbox bundle/theme

clean:
	@unlink $(HOME)/.vim >/dev/null 2>&1; true
	@unlink $(HOME)/.vimrc >/dev/null 2>&1; true

links:
	@ln -sfn $(CURDIR) $(HOME)/.vim
	@ln -sfn $(CURDIR)/vimrc $(HOME)/.vimrc
