-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	highlight = {
		enable = true
	},
	indent = { enable = true },
	autotag = { enable = true },
	ensure_intalled = {
		"help",
		"lua",
		"json",
		"javescript",
		"typescript",
		"tsx",
		"htm"
	},
	auto_install = true
})
