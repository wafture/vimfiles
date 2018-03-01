"
" pathogen
"
execute pathogen#infect()

syntax on
syntax enable

set et
set wrap
set number
set nocompatible
set background=dark
set formatoptions=qrn1
set backspace=indent,eol,start
set nobackup
set noswapfile
set nowritebackup
set smarttab
set tabstop=2
set expandtab
set autoindent
set shiftwidth=2
set showmatch
set complete-=i
set ruler
set showcmd
set ttimeout
set incsearch
set shiftround
set laststatus=2
set ttimeoutlen=50

" theme
colorscheme gruvbox
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1

" makefile
autocmd FileType make setlocal noexpandtab

" golang
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_build_constraints = 1
