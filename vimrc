"
" Pathogen
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

"
" 80 character line limit
"
set textwidth=79
if exists('+colorcolumn')
	set colorcolumn=80
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"
" Makefile
"
autocmd FileType make setlocal noexpandtab

"
" Go
"
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_build_constraints = 1

"
" Theme/Colors
"
colorscheme gruvbox
let g:airline_theme='base16'
let g:gruvbox_contrast_dark='hard'
autocmd BufWritePre * StripWhitespace
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1

