" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
call plug#end()

syntax enable
filetype plugin indent on

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
  " change some colors
  call Base16hi("Comment", g:base16_gui0C, "", g:base16_cterm0C, "", "", "")
  call Base16hi("LineNr", "", g:base16_gui00, "", g:base16_cterm00, "", "")
endif

let mapleader = ' '

" allow mouse scrolling and other mouse things
set mouse=a

" ez escape
inoremap jk <Esc>

" clipboard copy/paste
nnoremap <leader>y "+y
xnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

nnoremap <leader>e :e **/*

nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

nnoremap <leader>q  :q<CR>
nnoremap <leader>ww :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>wd :w<CR>:bdelete<CR>
nnoremap <leader>wz :w<CR><C-Z>

" buffer management
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>d :bdelete<CR>

nnoremap <leader>r <C-R>
nnoremap <leader>z <C-Z>

nnoremap <leader>h :noh<CR>

" search for ctags file all the way up to home
set tags=./tags,tags;$HOME

" :Rg command that uses ripgrep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

let c_space_errors = 1
let java_space_errors = 1

set hidden
set cursorline
set tabstop=4 shiftwidth=4
set expandtab " use spaces instead of tabs
set number

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
