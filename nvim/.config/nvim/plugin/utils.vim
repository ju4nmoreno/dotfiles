augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 60})
augroup END


inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect


:autocmd InsertEnter,InsertLeave * set cul!

" Emmet
let g:user_emmet_mode='a'    "enable all function in all mode.
" let g:user_emmet_leader_key='<C-J>'

" save fold
set viewoptions=folds,cursor
set sessionoptions=folds
augroup remember_folds
 autocmd!
 autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
 autocmd BufWinEnter ?* silent! loadview
augroup END


" ----------------------
let g:blamer_enabled = 1
