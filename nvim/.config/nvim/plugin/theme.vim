
" colorscheme ------------------------------------

" let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colorscheme ghdark
" colorscheme gruvbox
highlight ColorColumn ctermbg=16 guibg=#030e1b

" hi SignColumn guibg=none
" hi CursorLineNR guibg=None
highlight Normal guibg=none
" " highlight LineNr guifg=#ff8659
" " highlight LineNr guifg=#aed75f
" highlight LineNr guifg=#5eacd3
" highlight netrwDir guifg=#5eacd3
" highlight qfFileName guifg=#aed75f
" hi TelescopeBorder guifg=#5eacd


" let g:gruvbox_invert_selection='0'
