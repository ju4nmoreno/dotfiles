require("jmoreno.telescope")
-- require("jmoreno.eslint")

local nvim_lsp = require 'lspconfig'
local completion = require 'completion'
local lsp_status = require("lsp-status")

nvim_lsp.ccls.setup {settings = {diagnostics = {onChange = 4000}}, on_attach = completion.on_attach}

-- function to attach completion when setting up lsp
local on_attach = function(client)
    lsp_status.register_progress()
    lsp_status.config({
        status_symbol = "LSP ",
        indicator_errors = "E",
        indicator_warnings = "W",
        indicator_info = "I",
        indicator_hint = "J",
        indicator_ok = "ok"
    })

    require"completion".on_attach(client)

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            autocmd CursorHold *.* :lua vim.lsp.diagnostic.show_line_diagnostics()
            autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 300)
           augroup END
        ]], false)
    end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {"tsserver"}
for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach, capabilities = lsp_status.capabilities} end

-- efm-langserver
-- Setup diagnostics formaters and linters for non LSP provided files
nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
    cmd = {"diagnostic-languageserver", "--stdio"},
    filetypes = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'scss', 'markdown', 'pandoc'},
    init_options = {
        linters = {
            eslint = {
                command = '/node_modules/.bin/eslint',
                rootPatterns = {'.git'},
                debounce = 100,
                args = {'--stdin', '--stdin-filename', '%filepath', '--format', 'json'},
                sourceName = 'eslint',
                parseJson = {
                    errorsRoot = '[0].messages',
                    line = 'line',
                    column = 'column',
                    endLine = 'endLine',
                    endColumn = 'endColumn',
                    message = '[eslint] ${message} [${ruleId}]',
                    security = 'severity'
                },
                securities = {[2] = 'error', [1] = 'warning'}
            },
            markdownlint = {
                command = 'markdownlint',
                rootPatterns = {'.git'},
                isStderr = true,
                debounce = 100,
                args = {'--stdin'},
                offsetLine = 0,
                offsetColumn = 0,
                sourceName = 'markdownlint',
                securities = {undefined = 'hint'},
                formatLines = 1,
                formatPattern = {'^.*:(\\d+)\\s+(.*)$', {line = 1, column = -1, message = 2}}
            }
        },
        filetypes = {
            javascript = 'eslint',
            javascriptreact = 'eslint',
            typescript = 'eslint',
            typescriptreact = 'eslint',
            markdown = 'markdownlint',
            pandoc = 'markdownlint'
        },
        formatters = {
            prettierEslint = {command = 'prettier-eslint', args = {'--stdin'}, rootPatterns = {'.git'}},
            prettier = {command = 'prettier', args = {'--stdin-filepath', '%filename'}}
        },
        formatFiletypes = {
            css = 'prettier',
            javascript = 'prettierEslint',
            javascriptreact = 'prettierEslint',
            json = 'prettier',
            scss = 'prettier',
            typescript = 'prettierEslint',
            typescriptreact = 'prettierEslint'
        }
    }
}

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {spacing = 4, prefix = '~'},

    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = function(bufnr, client_id)
        local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
        -- No buffer local variable set, so just enable by default
        if not ok then return true end

        return result
    end,
    -- Disable a feature

    update_in_insert = true

})
