local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"html",
	"tsserver",
	"sumneko_lua",
})

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-e>"] = cmp.mapping.close(),
	["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
	["<C-c>"] = cmp.mapping.abort(),
	["<C-space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
	-- sign_incons = {},
})

lsp.setup_nvim_cmp({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp_mappings,
	sourece = cmp.config.sources({
		{ name = "buffer" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}),
})

local keymap = vim.keymap

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, noremap = true, silent = true }

	keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
	keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	-- keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

	-- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	-- vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
	-- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	-- vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	-- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
end)

lsp.setup()
