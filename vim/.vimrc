syntax on
filetype plugin indent on

set exrc
set guicursor=
set cursorline
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set nocompatible
set laststatus=2
" Give more space for displaying messages.
set cmdheight=2
highlight ColorColumn ctermbg=0 guibg=lightgrey
set updatetime=50

call plug#begin("~/.vim/plugged")
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'airblade/vim-rooter'
call plug#end()

colorscheme nord
:autocmd InsertEnter,InsertLeave * set cul!
let mapleader = " "

