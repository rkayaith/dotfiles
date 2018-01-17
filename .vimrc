syntax on
colo slate
filetype plugin indent on

let mapleader = ' '

" ez escape
inoremap jk <Esc>

" clipboard copy/paste
nnoremap <leader>y "+y
xnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>p "+p

nnoremap <leader>e :e **/*

nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

nnoremap <leader>q  :q<CR>
nnoremap <leader>ww :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>wz :w<CR><C-Z>

nnoremap <leader>r <C-R>
nnoremap <leader>z <C-Z>

let c_space_errors = 1
let java_space_errors = 1

set tabstop=4 shiftwidth=4
set expandtab " use spaces instead of tabs

set number
highlight LineNr ctermfg=DarkGray

set hlsearch incsearch ignorecase smartcase

set showcmd
set ruler
set rulerformat=%60(%=%f%6l,%-6(%c%V%)%P%)
"               |   | | |   |         |
"               |   | | |   |         percentage
"               |   | | |   padded col num
"               |   | | padded line num
"               |   | file name
"               |   right align
"               limit total length

" Matches lines longer than 132 characters as too long
syntax match lineTooLong "\v.{133,}"
highlight link lineTooLong Error
