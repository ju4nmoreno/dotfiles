" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" nnoremap <silent> gi :lua vim.lsp.buf.implementation()<cr>
" nnoremap <silent> gr :lua vim.lsp.buf.references()<cr>
" nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<cr>
" nnoremap <leader>rn :lua vim.lsp.buf.rename()<cr>
" nnoremap <leader>K :lua vim.lsp.buf.hover()<cr>
" nnoremap <leader>vca :lua vim.lsp.buf.code_action()<cr>
" nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<cr>
" nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<cr>

" autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.scss lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.css lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 100)

