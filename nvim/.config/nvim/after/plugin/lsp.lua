require("mason.settings").set({
	ui = {
		border = "rounded",
	},
})

local lsp = require("lsp-zero").preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

lsp.ensure_installed({
	"html",
	"tsserver",
})

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-e>"] = cmp.mapping.close(),
	["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
	["<C-c>"] = cmp.mapping.abort(),
	["<C-space>"] = cmp.mapping.complete(),
})

local cmp_sources = cmp.config.sources({
	{ name = "nvim_lsp" },
	{ name = "luasnip" },
	{ name = "buffer" },
	{ name = "cmp_luasnip" },
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

local keymap = vim.keymap

lsp.on_attach(function(c, bufnr)
	local opts = { buffer = bufnr, noremap = true, silent = true }

	keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
	keymap.set("n", "gdc", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	-- keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = false,
})

local lspconfig = require("lspconfig")
lspconfig.tsserver.setup({})
