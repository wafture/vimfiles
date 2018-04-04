.PHONY: default help clean install

default: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[m%10-s %s\n\033[0m", $$1, $$2}'
#
# make: info
#
APP_NAME    := vimfiles
APP_VERSION := 1.0
GIT_COMMIT  := $(shell git rev-list --count HEAD)
GIT_BRANCH  := $(shell git rev-parse --abbrev-ref HEAD)
ifeq ($(GIT_BRANCH), master)
	APP_VERSION := $(APP_VERSION).$(GIT_COMMIT)
else
	APP_VERSION := $(APP_VERSION).$(GIT_COMMIT).$(GIT_BRANCH)
endif

#
# make: formatted logger
#
log := `/bin/date "+%Y-%m-%d %H:%M:%S %z [$(APP_NAME)-$(APP_VERSION)]"`

install: ## install vim configuration
	@echo $(log) "installing vim-plug"
	@curl -sfLSo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	@echo $(log) "insalling vimrc"
	@cp -af conf/vimrc ~/.vimrc

	@echo $(log) "installing vim plug-ins"
	@vim +PlugInstall -c q -c q

clean: ## clean workspace and configurations
	@echo $(log) "cleaning vim workspace"
	@rm -f $(HOME)/.vimrc >/dev/null 2>&1; true
	@rm -rf $(HOME)/.vim >/dev/null 2>&1; true
