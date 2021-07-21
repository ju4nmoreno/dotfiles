
call plug#begin("~/.vim/plugged")

    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    
    " Neovim Tree shitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'

    " Emment
    Plug 'mattn/emmet-vim'

    " Themes
    Plug 'joshdick/onedark.vim'
    Plug 'wojciechkepka/vim-github-dark'
    Plug 'morhetz/gruvbox'
    Plug 'arcticicestudio/nord-vim'

    " Tope git/ surround
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'APZelos/blamer.nvim'
    Plug 'tpope/vim-surround'
    
    " Git names
    Plug 'itchyny/vim-gitbranch'

    " icons
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'

    " Vue
    Plug 'leafOfTree/vim-vue-plugin'

call plug#end()

let mapleader = " "

luafile ~/.config/nvim/lua/lua-ls.lua
luafile ~/.config/nvim/lua/general-ls.lua
luafile ~/.config/nvim/lua/juan.lua
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }}

autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.css lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)

