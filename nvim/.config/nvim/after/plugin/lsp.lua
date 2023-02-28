local lsp = require('lsp-zero').preset("recommended")

lsp.ensure_installed({
  'html',
  'tsserver'
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


lsp.setup()
