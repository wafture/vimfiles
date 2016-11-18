.PHONY: help default clean link

#
# help / usage
#
default: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?## "}; {printf "\033[35m%-6s => %s\n\033[0m", $$1, $$2}'

#
# make: targets
#
clean:  clean_home      ## clean up homedir
init:   init_vimfiles   ## initial checkout (recursive)
update: update_vimfiles ## update all repos (recursive)
links:  link_home       ## symlink workspace to homedir

#
# make: log
#
fmt := `/bin/date "+%Y-%m-%d %H:%M:%S %z make::vimfiles::"`

#
# remove symlinks to homedir
#
clean_home:
	@echo "$(fmt)$@::unlink init"
	@echo "$(fmt)$@::unlink => vim/"
	@unlink $(HOME)/.vim >/dev/null 2>&1; true
	@echo "$(fmt)$@::unlink => vimrc"
	@unlink $(HOME)/.vimrc >/dev/null 2>&1; true
	@echo "$(fmt)$@::unlink done"

#
# initial setup
#
init_vimfiles:
	@echo "$(fmt)$@::init init"
	@git submodule update --init --recursive
	@git submodule foreach git checkout master
	@git submodule foreach git fetch -p
	@git submodule foreach git pull origin master
	@echo "$(fmt)$@::init done"

#
# update errything
#
update_vimfiles:
	@echo "$(fmt)$@::setup init"
	@git submodule foreach git checkout master
	@git submodule foreach git fetch -p
	@git submodule foreach git pull origin master
	@echo "$(fmt)$@::setup done"

#
# symlink workspace to homedir
#
link_home:
	@echo "$(fmt)$@::link init"
	@echo "$(fmt)$@::link => vim/"
	@ln -sfn $(CURDIR) $(HOME)/.vim
	@echo "$(fmt)$@::link => vimrc"
	@ln -sfn $(CURDIR)/vimrc $(HOME)/.vimrc
	@echo "$(fmt)$@::link done"
