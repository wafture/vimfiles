.PHONY: default help clean install

default: clean install
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[m%10-s %s\n\033[0m", $$1, $$2}'
#
# make: info
#
NAME := vimfiles

#
# make: formatted logger
#
log := `/bin/date "+%Y-%m-%d %H:%M:%S %z [$(NAME)]"`

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
