set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:↲,precedes:«,extends:»
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set hlsearch
set wrap linebreak

autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.css lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.scss lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.json lua vim.lsp.buf.formatting_sync(nil, 1000)

let g:blamer_enabled = 1
let g:blamer_template = '<summary> <author> <author-time>'

" imap <expr> <tab> TabComplete()
" smap <expr> <tab> TabComplete()
" xmap <expr> <tab> TabComplete()

" function! TabComplete()
"   if &filetype =~ 'html\|css' && IsEmmetExpandable()
"     return "\<plug>(emmet-expand-abbr)
"   elseif pumvisible()
"     return "\<c-n>"
"   else
"     return "\<tab>"
"   endif
" endfunction

function! IsEmmetExpandable()
  if !emmet#isExpandable() | return 0 | endif
  if &filetype =~ 'css' | return 1 | endif

  let expr = matchstr(getline('.')[:col('.')], '\(\S\+\)$')
  return expr =~ '[.#>+*]' || index(s:emmetElements, expr) >= 0
endfunction

let s:emmetElements = ['a', 'abbr', 'acronym', 'address', 'applet', 'area', 'article', 'aside', 'audio', 'b', 'base', 'basefont', 'bdi', 'bdo', 'big', 'blockquote', 'body', 'br', 'button', 'canvas', 'caption', 'center', 'cite', 'code', 'col', 'colgroup', 'datalist', 'dd', 'del', 'details', 'dfn', 'dialog', 'dir', 'div', 'dl', 'dt', 'em', 'embed', 'fieldset', 'figcaption', 'figure', 'font', 'footer', 'form', 'frame', 'frameset', 'h1', 'head', 'header', 'hr', 'html', 'i', 'iframe', 'img', 'input', 'ins', 'kbd', 'keygen', 'label', 'legend', 'li', 'link', 'main', 'map', 'mark', 'menu', 'menuitem', 'meta', 'meter', 'nav', 'noframes', 'noscript', 'object', 'ol', 'optgroup', 'option', 'output', 'p', 'param', 'pre', 'progress', 'q', 'rp', 'rt', 'ruby', 's', 'samp', 'script', 'section', 'select', 'small', 'source', 'span', 'strike', 'strong', 'style', 'sub', 'summary', 'sup', 'table', 'tbody', 'td', 'textarea', 'tfoot', 'th', 'thead', 'time', 'title', 'tr', 'track', 'tt', 'u', 'ul', 'var', 'video', 'wbr']
      \ + ['emb', 'btn', 'sty', 'dlg', 'fst', 'fig', 'leg', 'tarea', 'hdr', 'cmd', 'colg', 'art', 'fset', 'src', 'prog', 'bq', 'kg', 'adr' , 'cap', 'datag', 'datal', 'sect', 'str', 'obj', 'ftr', 'optg', 'ifr', 'out', 'det', 'acr', 'opt']

" hi Normal ctermbg=NONE

" " Highlight Whitespaces
" highlight Whitespace ctermfg=Grey

" " Makes comments italic
" highlight Comment cterm=italic

" " Customize spell check highlighting
" highlight SpellBad ctermbg=Red ctermfg=White
" highlight SpellCap cterm=NONE ctermbg=NONE
" highlight SpellRare cterm=NONE ctermbg=NONE
" highlight SpellLocal cterm=undercurl ctermbg=NONE

" " Customize cursor line
" highlight CursorLine cterm=NONE ctermbg=Black 
" highlight CursorLineNr cterm=Bold ctermbg=Black ctermfg=White

" highlight LineNr ctermbg=NONE ctermfg=White
" highlight VertSplit ctermbg=Black

" " Customize folds
" highlight Folded ctermfg=White ctermbg=NONE cterm=bold

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 60})
augroup END


" config vim-snip
" ---------------------------------------------------------------------------

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
" nmap        s   <Plug>(vsnip-select-text)
" xmap        s   <Plug>(vsnip-select-text)
" nmap        S   <Plug>(vsnip-cut-text)
" xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

setlocal foldmethod=syntax

" let perl_fold=1
" augroup vimrc
"   au BufReadPre * setlocal foldmethod=indent
"   au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END
setlocal foldmethod=manual

" " Folding via syntax is used for this filetype.
" setlocal foldmethod=syntax

" " Vim's command window ('q:') and the :options window also set filetype=vim. We
" " do not want folding in these enabled by default, though, because some
" " malformed :if, :function, ... commands would fold away everything from the
" " malformed command until the last command.
" if bufname('') =~# '^\%(' . (v:version < 702 ? 'command-line' : '\[Command Line\]') . '\|option-window\)$'
"   " With this, folding can still be enabled easily via any zm, zc, zi, ...
"   " command.
"   setlocal nofoldenable
" else
"   " Fold settings for ordinary windows.
"   setlocal foldcolumn=4
" endif
"
au! FileType css,scss setl iskeyword+=-
