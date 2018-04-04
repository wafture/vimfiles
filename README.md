# vimfiles
meh vimfiles for vim(ing)

## setup
meesa like make

```
git clone git@github.com:wafture/vim.git ~/vimfiles
cd ~/vimfiles
make
```

## makefile
the makefile will do 4 things:

* `make clean`: clean any symlinks to the directory (for re-clones and general health)
* `make download`: download/init all submodules
* `make update`: checkout master and pull latest for all submodules
* `make link`: create symlinks for vimfiles to your homedir

## danke
* [vim-airline](https://github.com/vim-airline/vim-airline)
* [vim-delimitmate](https://github.com/Raimondi/delimitMate)
* [vim-endwise](https://github.com/tpope/vim-endwise)
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* [vim-go](https://github.com/fatih/vim-go)
* [vim-gruvbox](https://github.com/morhetz/gruvbox)
* [vim-indentline](https://github.com/Yggdroot/indentLine)
* [vim-json](https://github.com/elzr/vim-json)
* [vim-puppet](https://github.com/rodjek/vim-puppet)
* [vim-syntastic](https://github.com/scrooloose/syntastic)
* [vim-tabular](https://github.com/godlygeek/tabular)
* [vim-whitespace](https://github.com/ntpeters/vim-better-whitespace)
