
" Status Line START
let currentMode = mode()
set statusline=
set statusline+=\ %{mode()}
" set statusline+=\ %{FugitiveStatusline()}
set statusline+=\ %f
set statusline+=\ %M
set statusline+=%=
set statusline+=\ %c:%l/%L
set statusline+=\ %r
set statusline+=\ %y
set statusline+=\ [%n]

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=gray
  elseif a:mode == 'r'
    hi statusline guibg=blue
  else
    hi statusline guibg=red
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=black guifg=white

" default the statusline to green when entering Vim
hi statusline guibg=green

