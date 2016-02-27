.PHONY: default install clean download link

default: install

install: clean download update link

#
# clean (remove) links
#
clean:
	-@unlink $(HOME)/.vim >/dev/null 2>&1; true
	-@unlink $(HOME)/.vimrc >/dev/null 2>&1; true

#
# download (checkout) submodules
#
download:
	-@git submodule update --init --recursive

#
# update submodules
#
update:
	-@git submodule foreach git checkout master
	-@git submodule foreach git pull origin master

#
# create links
#
link:
	-@ln -sfn $(CURDIR) $(HOME)/.vim
	-@ln -sfn $(CURDIR)/vimrc $(HOME)/.vimrc

