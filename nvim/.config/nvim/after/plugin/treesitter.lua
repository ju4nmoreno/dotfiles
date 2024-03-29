require("nvim-treesitter.configs").setup({
	indent = {
		enable = true,
	},
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "lua", "vim", "javascript", "typescript", "html", "css" },
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
