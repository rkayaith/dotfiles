syntax on
colo slate
filetype plugin indent on

inoremap jk <Esc>

let c_space_errors = 1
let java_space_errors = 1

set tabstop=4 shiftwidth=4
set expandtab " use spaces instead of tabs

set number
highlight LineNr ctermfg=DarkGray

set hlsearch incsearch ignorecase smartcase

set showcmd
set ruler

" Matches lines longer than 132 characters as too long
syntax match lineTooLong "\v.{133,}"
highlight link lineTooLong Error
