set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:↲,precedes:«,extends:»
set tabstop=2 shiftwidth=2 noexpandtab smarttab
set colorcolumn=150

let g:blamer_enabled = 1
let g:blamer_template = '<summary> <author> <author-time>'

let g:cursorhold_updatetime = 100

imap <expr> <tab> TabComplete()
smap <expr> <tab> TabComplete()
xmap <expr> <tab> TabComplete()

function! TabComplete()
  if &filetype =~ 'html\|css' && IsEmmetExpandable()
    return "\<plug>(emmet-expand-abbr)
  elseif pumvisible()
    return "\<c-n>"
  else
    return "\<tab>"
  endif
endfunction

function! IsEmmetExpandable()
  if !emmet#isExpandable() | return 0 | endif
  if &filetype =~ 'css' | return 1 | endif

  let expr = matchstr(getline('.')[:col('.')], '\(\S\+\)$')
  return expr =~ '[.#>+*]' || index(s:emmetElements, expr) >= 0
endfunction

let s:emmetElements = ['a', 'abbr', 'acronym', 'address', 'applet', 'area', 'article', 'aside', 'audio', 'b', 'base', 'basefont', 'bdi', 'bdo', 'big', 'blockquote', 'body', 'br', 'button', 'canvas', 'caption', 'center', 'cite', 'code', 'col', 'colgroup', 'datalist', 'dd', 'del', 'details', 'dfn', 'dialog', 'dir', 'div', 'dl', 'dt', 'em', 'embed', 'fieldset', 'figcaption', 'figure', 'font', 'footer', 'form', 'frame', 'frameset', 'h1', 'head', 'header', 'hr', 'html', 'i', 'iframe', 'img', 'input', 'ins', 'kbd', 'keygen', 'label', 'legend', 'li', 'link', 'main', 'map', 'mark', 'menu', 'menuitem', 'meta', 'meter', 'nav', 'noframes', 'noscript', 'object', 'ol', 'optgroup', 'option', 'output', 'p', 'param', 'pre', 'progress', 'q', 'rp', 'rt', 'ruby', 's', 'samp', 'script', 'section', 'select', 'small', 'source', 'span', 'strike', 'strong', 'style', 'sub', 'summary', 'sup', 'table', 'tbody', 'td', 'textarea', 'tfoot', 'th', 'thead', 'time', 'title', 'tr', 'track', 'tt', 'u', 'ul', 'var', 'video', 'wbr']
      \ + ['emb', 'btn', 'sty', 'dlg', 'fst', 'fig', 'leg', 'tarea', 'hdr', 'cmd', 'colg', 'art', 'fset', 'src', 'prog', 'bq', 'kg', 'adr' , 'cap', 'datag', 'datal', 'sect', 'str', 'obj', 'ftr', 'optg', 'ifr', 'out', 'det', 'acr', 'opt']

augroup LspEFM
  au!
  autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'efm-langserver',
      \ 'cmd': {server_info->['efm-langserver', '~/.config/efm-langserver/config.yaml']},
      \ 'allowlist': ['vim', 'eruby', 'markdown', 'yaml'],
      \ })
augroup END
