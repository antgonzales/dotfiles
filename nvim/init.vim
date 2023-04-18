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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/seoul256.vim'
call plug#end()

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

" Turn off the banner in Netrw Directory Listing
let g:netrw_banner = 0

" Hide ./ when opening Netrw
let g:netrw_list_hide = '^\./$'
let g:netrw_hide = 1

" Tree style file explorer in Netrw
let g:netrw_liststyle=3

" Install Coc extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-prettier', 'coc-eslint']

" Automatically format files on save
let g:coc_user_config = {"coc.preferences.formatOnSaveFiletypes": ["typescript", "typescriptreact", "json", "javascript", "javascriptreact", "css", "markdown" ]}

" Use <cr> to select the first completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Turn on syntax highlighting using Neovim Treesitter and turn off
" default regex based syntax highlighting
" You may need to install additional syntax with :TSInstall <LANGUAGE>
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" coc.vim Configurations
" https://github.com/neoclide/coc.nvim#example-vim-configuration
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
