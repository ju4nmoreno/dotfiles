vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- color schema
	use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme

	--[[ use({
 	"rose-pine/neovim",
 	as = "rose-pine",
 	config = function()
 		vim.cmd("colorscheme rose-pine")
 	end,
 }) ]]

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")

	-- UnderTree
	use("mbbill/undotree")

	use("tpope/vim-fugitive")

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- snippet engine
			-- { "rafamadriz/friendly-snippets" },
		},
	})

	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("jayp0521/mason-null-ls.nvim")

	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("ThePrimeagen/vim-be-good")

	use("mattn/emmet-vim")

	use("tpope/vim-surround")

	use("lewis6991/gitsigns.nvim")
	use("APZelos/blamer.nvim")
end)
