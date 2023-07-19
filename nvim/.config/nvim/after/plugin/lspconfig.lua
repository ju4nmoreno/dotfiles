local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local protocol = require("vim.lsp.protocol")

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

local enable_format_on_save = function(_, bufnr)
	vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup_format,
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ bufnr = bufnr })
		end,
	})
end

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	-- -- local opts = { buffer = bufnr, noremap = true, silent = true }
	-- --
	-- -- keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
	-- -- keymap.set("n", "gdc", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- -- keymap.set("n", "gd", function()
	-- -- 	vim.lsp.buf.definition()
	-- -- end, opts)
	-- -- keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)
	-- -- keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- -- keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	-- -- keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	-- -- -- keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	-- -- keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	-- -- keymap.set("n", "<leader>D", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	-- -- keymap.set("n", "K", function()
	-- -- 	vim.lsp.buf.hover()
	-- -- end, opts)
	-- --
	-- local function buf_set_keymap(...)
	-- 	vim.api.nvim_buf_set_keymap(bufnr, ...)
	-- end
	--
	-- --Enable completion triggered by <c-x><c-o>
	-- --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
	-- --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	--
	-- -- Mappings.
	-- local opts = { noremap = true, silent = true }
	--
	-- -- See `:help vim.lsp.*` for documentation on any of the below functions
	-- buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- buf_set_keymap("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", opts)
	-- --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	-- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

vim.keymap.set("n", "<space>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

nvim_lsp.tsserver.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
