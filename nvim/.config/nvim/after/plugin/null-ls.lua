local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local sources = {
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.prettier.with({
		filetypes = { "html", "scss", "css", "vue", "javascript", "javascriptreact" },
	}),
	null_ls.builtins.formatting.eslint_d.with({
		filetypes = { "typescript", "typescriptreact" },
	}),
	null_ls.builtins.diagnostics.eslint_d.with({
		diagnostics_format = "[eslint] #{m}\n(#{c})",
	}),
}

null_ls.setup({
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					print("is formatting try")
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})

local eslint = require("lspconfig").eslint

eslint.setup({
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
})
