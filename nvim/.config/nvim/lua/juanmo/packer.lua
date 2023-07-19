vim.cmd([[packadd packer.nvim]])
-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- lsp
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("nvim-lua/plenary.nvim") -- Common utilities
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/nvim-cmp") -- Completion

	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
		},
	})

	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("hoob3rt/lualine.nvim") -- lua line
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("ThePrimeagen/vim-be-good")
	use("mattn/emmet-vim")
	use("tpope/vim-surround")
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")
	use("APZelos/blamer.nvim")
	use("folke/tokyonight.nvim")
end)
