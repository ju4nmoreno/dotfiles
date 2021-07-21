-- npm install -g vscode-css-languageserver-bin
require'lspconfig'.cssls.setup {
	on_attach = require'lsp'.common_on_attach,
	cmd = {"css-languageserver", "--stdio"},
    settings = {documentFormatting = false}
}
