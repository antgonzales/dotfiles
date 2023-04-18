" Download plug.vim if it doesn't exist yet
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source ~/.config/nvim/init.vim
\| endif


call plug#begin('~/.config/nvim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/seoul256.vim'
call plug#end()

let g:seoul256_background = 239
colo seoul256

" Turn off temporary swap and backup files
set noswapfile
" Turn on line numbers
set number
" Use the clipboards of Vim and Window
set clipboard+=unnamedplus
" Visual selection automatically copied to the clipboard
set go+=a
" Moves the cursor to found characters as you search
set incsearch

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1

let g:ale_sign_error = "🐛"
let g:ale_sign_warning = "⚠️"
let g:ale_sign_info = "ℹ"

let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "🔥 "

let g:deoplete#enable_at_startup = 1

" Turn off the banner in Netrw Directory Listing
let g:netrw_banner = 0

" Hide ./ when opening Netrw
let g:netrw_list_hide = '^\./$'
let g:netrw_hide = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set smarttab
set cindent
