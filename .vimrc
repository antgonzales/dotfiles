syntax enable
set background=dark
colorscheme solarized
set directory^=$HOME/.vim/tmp//
set number relativenumber
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set wrap linebreak nolist
set textwidth=80
set colorcolumn=+1
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

