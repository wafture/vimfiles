.PHONY: help default links init update all

#
# Help/Usage
#
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s %s\n", $$1, $$2}'

default: help

#
# Build Commands
#
links: clean link ## Cleanup and re-link symlinks from source to homedir

init: clean init_vimfiles update_vimfiles link ## Run initial setup for vimfiles

update: clean update_vimfiles link ## Run update(s) for all dependent repos

all: clean init_vimfiles update_vimfiles link ## Run all make tasks associated with the repo

#
# Make Log Format
#
fmt := `/bin/date "+%Y-%m-%d %H:%M:%S %z [vimfiles]"`

#
# Cleanup (remove) Symlinks
#
clean:
	@echo $(fmt) "unlinking .vim/"
	-@unlink $(HOME)/.vim >/dev/null 2>&1; true
	@echo $(fmt) "unlinking .vimrc"
	-@unlink $(HOME)/.vimrc >/dev/null 2>&1; true

#
# Run initial setup
#
init_vimfiles:
	@echo $(fmt) "initializing vimfiles"
	-@git submodule update --init --recursive

#
# Update all dependent repositories
#
update_vimfiles:
	@echo $(fmt) "updating vimfiles"
	-@git submodule foreach git checkout master
	-@git submodule foreach git fetch -p
	-@git submodule foreach git pull origin master

#
# Symlink VIM files to $(HOME)
#
link:
	@echo $(fmt) "symlinking .vim/"
	-@ln -sfn $(CURDIR) $(HOME)/.vim
	@echo $(fmt) "symlinking .vimrc"
	-@ln -sfn $(CURDIR)/vimrc $(HOME)/.vimrc
