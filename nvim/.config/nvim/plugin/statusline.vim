" Status Line START
set statusline=
set statusline+=\ [%{gitbranch#name()}]
set statusline+=\ %f
set statusline+=\ %M
set statusline+=%=
set statusline+=\ %c:%l/%L
set statusline+=\ %r
set statusline+=\ %y
set statusline+=\ [%n]
