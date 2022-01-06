local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  client.resolved_capabilities.document_formatting = false
  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=#db0000
        hi LspReferenceText cterm=bold ctermbg=red guibg=#db0000
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=#db0000
      ]], true
    )
  end

  -- augroup lsp_document_highlight
  --   autocmd! * <buffer>
  --   autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --   autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  -- augroup END

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>E', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>Q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "tsserver" }
-- local servers = { "tsserver", "html", "cssls" }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 40 },
    capabilities = capabilities
  }
end

-- require'lspconfig'.html.setup {capabilities = capabilities, on_attach = on_attach}

-- require'lspconfig'.tsserver.setup {capabilities = capabilities, on_attach = on_attach}

-- require'lspconfig'.cssls.setup {
-- 		cmd = {"vscode-css-language-server", "--stdio"},
-- 		filetypes = {"css", "scss", "less"},
-- 		settings = {css = {validate = true}, less = {validate = true}, scss = {validate = true}},
-- 		capabilities = capabilities
-- }

-- require'lspconfig'.jsonls.setup {
--     commands = {
--         Format = {
--             function()
--                 vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
--             end
--         }
--     }
-- }

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     -- Enable underline, use default values
--     underline = true,
--     -- Enable virtual text, override spacing to 4
--     virtual_text = { spacing = 4, prefix = '~' },
--     -- Use a function to dynamically turn signs off
--     --
--     --
--     -- and on, using buffer local variables
--     sings = true,
--     -- signs = function(bufnr, client_id)
--     --   local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
--     --   -- No buffer local variable set, so just enable by default
--     --   if not ok then return true end
--
--     --   return result
--     -- end,
--     -- Disable a feature
--
--     update_in_insert = true
--   }
-- )
--
