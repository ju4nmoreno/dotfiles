call plug#begin('~/.vim/plugged')
	" Plebvim lsp Plugins
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-lua/diagnostic-nvim' 
  Plug 'nvim-lua/lsp-status.nvim'
  Plug 'sbdchd/neoformat'
	Plug 'tjdevries/nlua.nvim'
	Plug 'tjdevries/lsp_extensions.nvim'

  Plug 'andrejlevkovitch/vim-lua-format'

  " Nord Theme
	Plug 'arcticicestudio/nord-vim'

  " Neovim Tree shitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'

  " Telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzy-native.nvim'

   " javascript and typescript
   " Plug 'leafgarland/typescript-vim'
   Plug 'peitalin/vim-jsx-typescript'
   Plug 'pangloss/vim-javascript'
   Plug 'maxmellon/vim-jsx-pretty'

   " Tope
   Plug 'tpope/vim-fugitive'
   Plug 'tpope/vim-surround'

   " Comments
   Plug 'preservim/nerdcommenter'

   " Emmet
   Plug 'mattn/emmet-vim'

   " Icons"   
   Plug 'ryanoasis/vim-devicons'
  
call plug#end()

" lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
lua require 'lspconfig'.tsserver.setup{}

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif 

" highlight ColorColumn ctermbg=0 guibg=grey
" highlight Normal guibg=none
" highlight LineNr guifg=#ff8659
" highlight LineNr guifg=#aed75f
" highlight LineNr guifg=#5eacd3
" highlight netrwDir guifg=#5eacd3
" highlight qfFileName guifg=#aed75f
" hi TelescopeBorder guifg=#5eacd


autocmd FileType lua nnoremap <buffer> <c-k> :call LuaFormat()<cr>
autocmd BufWrite *.lua call LuaFormat()

autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.scss lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.css lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 100)
