-- Example configuations here: https://github.com/mattn/efm-langserver
-- JavaScript/React/TypeScript
local prettier = {
    formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
    formatStdin = true
}

require"lspconfig".efm.setup {
    on_attach = require'lsp'.common_on_attach,
    -- init_options = {initializationOptions},
    init_options = {documentFormatting = true},
    -- filetypes = {"lua", "scss", "python", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml", "markdown"},
    filetypes = {},
    -- filetypes = {"scss", "javascriptreact", "javascript", "html", "css", "json"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            -- javascriptreact = {prettier},
            -- javascript = {prettier},
            -- html = {prettier},
            -- scss = {eslint},
            -- css = {prettier}
        }
    }
}

-- Also find way to toggle format on save
-- maybe this will help: https://superuser.com/questions/439078/how-to-disable-autocmd-or-augroup-in-vim
