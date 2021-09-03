local prettier = {
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    -- formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT} --stdin",
    formatStdin = true
}

local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --ntdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout  --stdin --sntdin-filename=${INPUT}",
    formatStdin = true
}

require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"lua", "html", "css", "vim", "javascript", "javascript.jsx", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx"},

    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
                    formatStdin = true
                }
            },
            html = {prettier, eslint},
            css = {prettier, eslint},
            javascript = {prettier, eslint},
            typescript = {prettier, eslint},
            javascriptreact = {prettier, eslint},
            typescriptreact = {prettier, eslint}
        }
    }
}
vim.cmd [[
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.css lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
]]

-- autocmd FileType javascript setlocal formatprg=prettier\ --parser\ typescript
--
