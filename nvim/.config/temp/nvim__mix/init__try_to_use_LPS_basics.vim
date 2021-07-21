set nu
set relativenumber

call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'arcticicestudio/nord-vim'
call plug#end()

colorscheme nord

" set completeopt=menuone,noinsert,noselect
" let g:completion_matching_stategy_list = ['exact', 'substring', 'fuzzy']

lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }

" on_attach=require'completion'.on_attach

