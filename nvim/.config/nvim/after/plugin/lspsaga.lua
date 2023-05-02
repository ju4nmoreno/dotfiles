local saga = require("lspsaga")

saga.setup({
	-- keybinds for navigation in lspsaga window
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	-- use enter to open file with definition preview
	definition = {
		edit = "<CR>",
	},
	ui = {
		colors = {
			normal_bg = "#FF0000",
		},
		code_action = "",
		border = "rounded",
		winblend = 0,
		expand = "",
		collapse = "",
		incoming = " ",
		outgoing = " ",
		hover = " ",
		title = true,
	},
})

