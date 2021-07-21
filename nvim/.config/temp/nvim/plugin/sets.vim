let g:python3_host_prog='/usr/local/bin/python3'

syntax on

set autoread
set number relativenumber
set noerrorbells
set incsearch
set ignorecase
set smartcase
set nohlsearch
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set noswapfile
set smartindent
set noswapfile
set linebreak
set hidden " hide buffer
set laststatus=2
set termguicolors
set foldenable
set foldlevelstart=1
set foldnestmax=10
set foldmethod=indent
set foldnestmax=1
set nofoldenable
set foldcolumn=1
set colorcolumn=80
set smarttab
set autoindent
" set undofile
" set undodir=~/.vim/undodir
set encoding=UTF-8
set updatetime=50
set scrolloff=8
set signcolumn=yes
set shortmess+=c
set cursorline

" Disable arrow keys
map  <up>    :echoerr "What are you doing? up"<cr>
map  <down>  :echoerr "What are you doing?" down"<cr>
map  <left>  :echoerr "What are you doing? <- ------- ----- --- "<cr>
map  <right> :echoerr "What are you doing? -> ------------------"<cr>

map <silent><leader>w :w<CR>
map <silent><leader>q :bd<cr>
map <silent><leader>x :x<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" nnoremap <leader>u :UndotreeShow<CR>
" nnoremap <leader>pv :wincmd v<CR><C-w>h :Ex <bar> :vertical resize 30<CR>
" nnoremap <Leader>ps :Rg<SPACE>
" nnoremap <C-p> :GFiles<CR>
" nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +10<CR>
nnoremap <Leader>- :vertical resize -10<CR>
nnoremap <Leader>i <C-w>= 
nnoremap <Leader>z <C-w><bar> 
" nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
nnoremap <Leader>m :tabe <bar> :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>e :Ex<CR>
nnoremap <Leader>o :only<CR>
