local status, packer = pcall(require, "packer")
if (not status) then
	print("Packer is not installed")
	return
end

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
	use 'onsails/lspkind-nvim' -- vscode-like pictograms

	use 'hrsh7th/nvim-cmp' -- Completion
	use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
	use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
	use 'hrsh7th/cmp-cmdline' -- nvim-cmp source for neovim's built-in LSP
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	})
	use 'neovim/nvim-lspconfig' -- LSP
	use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	use 'L3MON4D3/LuaSnip'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'kyazdani42/nvim-web-devicons' -- File icons
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'
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

end)