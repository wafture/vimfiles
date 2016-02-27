"
" Pathogen
"
execute pathogen#infect()

"
" Common (all)
"
syntax on
syntax enable

set et
set wrap
set number
set autoindent
set nocompatible
set background=dark
set formatoptions=qrn1
set backspace=indent,eol,start

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
" Common (swap)
"
set nobackup
set noswapfile
set nowritebackup

"
" Common (tabs)
"
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4

"
" Common (match)
"
set showmatch
set complete-=i

"
" Jessie Frazelle
"
set ruler
set showcmd
set ttimeout
set incsearch
set shiftround
set laststatus=2
set ttimeoutlen=50

"
" Git Gutter
"
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 1
let g:gitgutter_sign_column_always = 1

"
" Go
"
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_build_constraints = 1

"
" Gruvbox Colorscheme
"
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

"
" JSON
"
let g:vim_json_syntax_conceal = 0


"
" Syntastic
"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

"
" Paste
"
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return "
endfunction"]]]]"

