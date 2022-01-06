local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}
    use 'neovim/nvim-lspconfig'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lua'

    use 'saadparwaiz1/cmp_luasnip'

    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    use 'hrsh7th/nvim-compe'

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/playground'
    use 'p00f/nvim-ts-rainbow'

    use 'nvim-lua/popup.nvim'
    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'kosayoda/nvim-lightbulb'
    use 'mfussenegger/nvim-jdtls'

    use 'christianchiarulli/nvcode-color-schemes.vim'

    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('gitsigns').setup()
        end
    }

    use 'windwp/nvim-autopairs'

    use 'mattn/emmet-vim'

    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'APZelos/blamer.nvim'
    use 'tpope/vim-surround'

    use 'itchyny/vim-gitbranch'

    use 'lukas-reineke/format.nvim'

end)

