local lsp = require("lsp-zero").preset({})

lsp.ensure_installed({
	"tsserver",
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local cmp = require("cmp")

cmp.setup({
	sources = { { name = "nvim_lsp" } },
	mapping = cmp.mapping.preset.insert({
		["<C-y"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>ws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>d", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>gr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = { "javascript", "html", "css", "json", "typescript", "javascriptreact", "typescriptreact", "lua" },
	},
})

lsp.setup()

local null_ls = require("null-ls")

null_ls.setup({
	sources = {

		-- Replace these with the tools you have installed
		-- make sure the source name is supported by null-ls
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier.with({
			filetypes = { "html", "scss", "css", "vue", "javascript" },
		}),
		null_ls.builtins.formatting.eslint_d.with({
			filetypes = { "javascriptreact", "typescript", "typescriptreact" },
		}),
		-- null_ls.builtins.diagnostics.eslint_d.with({
		-- 	-- diagnostics_format = "[eslint] #{m}\n(#{c})",
		-- }),
	},
})
