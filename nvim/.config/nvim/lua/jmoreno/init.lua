require("jmoreno.telescope")

-- Formatting via efm
local prettier = require "jmoreno/efm/prettier"
local eslint = require "jmoreno/efm/eslint"
local luafmt = require "/jmoreno/efm/luafmt"

local nvim_lsp = require'lspconfig'
local completion = require'completion'

-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
    
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings.
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>:Exp<CR>', opts)

    if client.resolved_capabilities.completion then
      completion.on_attach(client, bufnr)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
           augroup END
        ]],
            false
        )
    end
end

-- autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 500)

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {
  "jsonls",
  "tsserver",
}

--Enable completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = function() return vim.loop.cwd() end
    }
end

-- cssls
nvim_lsp.cssls.setup {
    cmd = {"css-languageserver", "--stdio"},
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    settings = {
      css = {
        validate = false
      },
      scss = {
        validate = true,
         capabilities = {
           textDocument = {
             completion = {
                 completionItem = {
                     snippetSupport = true
                 }
             }
         }
    }
}
}
}

-- Vim lsp
nvim_lsp.vimls.setup {on_attach = on_attach}

-- JSON lsp
nvim_lsp.jsonls.setup {on_attach = on_attach}

-- VUE
nvim_lsp.vuels.setup {on_attach = on_attach}

local capa = vim.lsp.protocol.make_client_capabilities()
capa.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.html.setup {
  capabilities = capa
}

local languages = {
    typescript = {eslint},
    javascript = {eslint},
    vue = {eslint},
    typescriptreact = {eslint},
    javascriptreact = {eslint},
    json = {eslint},
    html = {eslint},
    scss = {eslint},
    css = {eslint},
    markdown = {eslint}
}

 nvim_lsp.efm.setup {
     root_dir = nvim_lsp.util.root_pattern("yarn.lock", ".git"),
     filetypes = vim.tbl_keys(languages),
     init_options = {documentFormatting = true, codeAction = true},
     settings = {languages = languages, log_level = 1, log_file = '~/efm.log'},
     on_attach = on_attach
 }

-- Setup diagnostics formaters and linters for non LSP provided files
-- nvim_lsp.diagnosticls.setup {
--     on_attach = on_attach,
--     capabilities = capabilities, 
--     cmd = {"diagnostic-languageserver", "--stdio"},
--     filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'scss', 'markdown' },
--   init_options = {
--     linters = {
--       eslint = {
--         command = './node_modules/.bin/eslint',
--         rootPatterns = { '.git' },
--         debounce = 100,
--         args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
--         sourceName = 'eslint',
--         parseJson = {
--           errorsRoot = '[0].messages',
--           line = 'line',
--           column = 'column',
--           endLine = 'endLine',
--           endColumn = 'endColumn',
--           message = '[eslint] ${message} [${ruleId}]',
--           security = 'severity'
--         },
--         securities = {
--           [2] = 'error',
--           [1] = 'warning'
--         }
--       },
--       markdownlint = {
--         command = 'markdownlint',
--         rootPatterns = { '.git' },
--         isStderr = true,
--         debounce = 100,
--         args = { '--stdin' },
--         offsetLine = 0,
--         offsetColumn = 0,
--         sourceName = 'markdownlint',
--         securities = {
--           undefined = 'hint'
--         },
--         formatLines = 1,
--         formatPattern = {
--           '^.*:(\\d+)\\s+(.*)$',
--           {
--             line = 1,
--             column = -1,
--             message = 2,
--           }
--         }
--       }
--     },
--     filetypes = {
--       css = 'eslint',
--       javascript = 'eslint',
--       javascriptreact = 'eslint',
--       typescript = 'eslint',
--       typescriptreact = 'eslint',
--       markdown = 'markdownlint',
--       pandoc = 'markdownlint'
--     },
--     formatFiletypes = {
--        css = 'eslint',
--        javascript = 'eslint',
--        javascriptreact = 'eslint',
--        json = 'eslint',
--        scss = 'eslint',
--        typescript = 'eslint',
--        typescriptreact = 'eslint'
--     }
--   }
-- }
--
---- Enable diagnostics
--vim.lsp.handlers["textDocument/publishDiagnostics"] =
--    vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics,
--     {
--       -- Enable underline, use default values
--     underline = true,
--     -- Enable virtual text, override spacing to 4
--     virtual_text = {
--       spacing = 4,
--       prefix = '~',
--     },
--     -- Use a function to dynamically turn signs off
--     -- and on, using buffer local variables
--     signs = function(bufnr, client_id)
--       local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
--       -- No buffer local variable set, so just enable by default
--       if not ok then
--         return true
--       end
-- 
--       return result
--     end,
--     -- Disable a feature
--     update_in_insert = true,
--     }
-- )
