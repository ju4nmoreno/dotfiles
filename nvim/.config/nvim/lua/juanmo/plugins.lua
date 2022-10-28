local status, packer = pcall(require, "packer")
if (not status) then
	print("Packer is not installed")
	return
end

-- Autocommand that releads neovim whenever you save this file
vim.cmd( [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'svrana/neosolarized.nvim',
		requires = { 'tjdevries/colorbuddy.nvim' }
	}
	use 'folke/tokyonight.nvim'
	use 'nvim-lualine/lualine.nvim' -- Statusline
	use 'nvim-lua/plenary.nvim' -- Common utilities

	-- autocompletion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-path'

	-- snippets
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'

	-- managing & installing lsp servers
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	-- configuring lsp servers
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use({ "glepnir/lspsaga.nvim", branch = "main", })
	use 'jose-elias-alvarez/typescript.nvim'
	use 'onsails/lspkind-nvim' -- vscode-like pictograms

	-- formatting & linting
	use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use 'jayp0521/mason-null-ls.nvim'
	use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- auto closing
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'


	use 'kyazdani42/nvim-web-devicons' -- File icons
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'norcalli/nvim-colorizer.lua'
	use 'folke/zen-mode.nvim'

	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
	use 'akinsho/nvim-bufferline.lua'
	-- use 'github/copilot.vim'
	-- Git
	use("lewis6991/gitsigns.nvim")
	use("APZelos/blamer.nvim")
	use 'dinhhuy258/git.nvim' -- For git blame & browse

	-- mattn/emmet-vim
	use("mattn/emmet-vim")

	-- Tope
	use("tpope/vim-surround")
	use("tpope/vim-fugitive")

	use("numToStr/Comment.nvim") -- Easily comment stuff

	use("ThePrimeagen/vim-be-good")
	use("mbbill/undotree")
end)
