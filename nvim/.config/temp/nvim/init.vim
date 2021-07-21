
call plug#begin('~/.vim/plugged')

  Plug 'nvim-lua/completion-nvim'
  Plug 'neovim/nvim-lspconfig'
  " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  Plug 'nvim-lua/lsp-status.nvim'
  Plug 'sbdchd/neoformat'
  Plug 'tjdevries/nlua.nvim'
  Plug 'tjdevries/lsp_extensions.nvim'
  Plug 'sbdchd/neoformat'

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'

  " Emment 
  Plug 'mattn/emmet-vim'

  " Themes
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'pangloss/vim-javascript'

  " Tope git/ surround
  Plug 'tpope/vim-fugitive'
  Plug 'APZelos/blamer.nvim'
  Plug 'tpope/vim-surround'

  " icons
  Plug 'ryanoasis/vim-devicons'

call plug#end()

let mapleader = " "

" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"  highlight = { enable = true },
" }
" EOF

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 60})
augroup END

" Emmet
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_leader_key='<C-l>'

" ----------------------------------------------------------------------------
" Status Line START
set statusline=
set statusline+=\ %f
set statusline+=\ ___%M___
set statusline+=%=
set statusline+=\ %c:%l/%L
set statusline+=\ %r
set statusline+=\ %y
set statusline+=\ [%n]

" ----------------------------------------------------------------------------
"  Neoformat
 augroup fmt
   autocmd!
   autocmd BufWritePre * undojoin | Neoformat
 augroup END

" ----------------------------------------------------------------------------
"  Save folds
" "'augroup remember_folds
 "" autocmd!
 "" autocmd BufWinLeave * mkview
 "" autocmd BufWinEnter * silent! loadview
" augroup END

" ----------------------------------------------------------------------------
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" ----------------------------------------------------------------------------
let g:blamer_enabled = 1
let g:blamer_date_format = '%d/%m/%y'
let g:blamer_template = '<author> | <author-time> <commit-short> <summary>'

