vim.cmd([[
  let g:netrw_keepdir = 0

  hi! link netrwMarkFile Search

  nnoremap <leader>dd :Lexplore %:p:h<CR>
  " Leader dd: Will open Netrw in the directory of the current file.
  nnoremap <Leader>da :Lexplore<CR>
  " Leader da: Will open Netrw in the current working directory.

  let g:netrw_sort_options = ''

]])
