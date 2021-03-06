let g:python3_host_prog='/usr/local/bin/python3'
syntax on
filetype plugin on
filetype plugin on

set autoread
set number relativenumber
set noerrorbells
set incsearch
set ignorecase
set smartcase
set nohlsearch
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set noswapfile
set smartindent
set noswapfile
set linebreak
set hidden " hide buffer
set laststatus=2
set termguicolors
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set foldnestmax=1
set nofoldenable
set foldcolumn=1
set colorcolumn=80
set smarttab
set autoindent
set undofile
set undodir=~/.vim/undodir
set encoding=UTF-8
set updatetime=50
set scrolloff=8
set signcolumn=yes
set shortmess+=c




" Break the habit of Reaching for the Arrow Keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" source $HOME/.config/nvim/plugConfig/coc.vim

" indentLine
let g:indentLine_faster = 1
let g:indentLine_setConceal = 0

" emmet
let g:user_emmet_leader_key='<C-Z>'

" Ignoring node_modules
" let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" leader key
let mapleader = " "

let  bclose_multiple = 0

" let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 }}
" let $FZF_DEFAULT_COMMAND='--reverse'

" Files Explorer -----------------------------------------------------------
" let g:netrw_liststyle = 3
" let g:netrw_banner = 0
let g:netrw_localrmdir='rm -r'

" Integrated Terminal -------------------------------------------------------
" open new split panes to right and below
command! -nargs=0 Prettier :CocCommand prettier.formatFile
set splitright
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 8
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

autocmd FileType json syntax match Comment +\/\/.\+$+

" setup folding
augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

" commenter settings -----------
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" presentation mode
noremap <Left> :silent bp<CR> :redraw!<CR>
noremap <Right> :silent bn<CR> :redraw!<CR>
nmap <F5> :set relativenumber! number! showmode! showcmd! hidden! ruler!<CR>
nmap <F2> :call DisplayPresentationBoundaries()<CR>
nmap <F3> :call FindExecuteCommand()<CR>
" makes Ascii art font
nmap <leader>F :.!toilet -w 200 -f standard<CR>
nmap <leader>f :.!toilet -w 200 -f small<CR>
" makes Ascii border
nmap <leader>1 :.!toilet -w 200 -f term -F border<CR>

let g:presentationBoundsDisplayed = 0
function! DisplayPresentationBoundaries()
  if g:presentationBoundsDisplayed
    match
    set colorcolumn=0
    let g:presentationBoundsDisplayed = 0
  else
    highlight lastoflines ctermbg=darkred guibg=darkred
    match lastoflines /\%23l/
    set colorcolumn=80
    let g:presentationBoundsDisplayed = 1
  endif
endfunction

function! FindExecuteCommand()
  let line = search('\S*!'.'!:.*')
  if line > 0
    let command = substitute(getline(line), "\S*!"."!:*", "", "")
    execute "silent !". command
    execute "normal gg0"
    redraw
  endif
endfunction




" Mappings

" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <<C-w>|silent> <space>p  :<C-u>CocListResume<CR>

" others maps
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<CR><C-w>h :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +10<CR>
nnoremap <Leader>- :vertical resize -10<CR>
nnoremap <Leader>i <C-w>= 
nnoremap <Leader>z <C-w><bar> 
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
nnoremap <Leader>m :tabe <bar> :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>E :Ex<CR>
nnoremap <Leader>o :only<CR>

" Git Diff
" nmap <leader>gs :G<CR>
" nmap <leader>gf <C-w>j :q <bar> :Gdiffsplit<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>

" map indent {}[]()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" rename all project
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" buffer
" nnoremap <Leader>bd :bd!<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>

" copy and peste
nnoremap <leader>v "+p
nnoremap <leader>c "+y

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Show syntax highlighting groups for word under cursor
" nmap <C-S-P> :call <SID>SynStack()<CR>
" function! <SID>SynStack()
"   if !exists("*synstack")
"     return
"   endif
"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc

vnoremap <leader>ay "ay
vnoremap <leader>ap "ap

" mapping remove highlight after select a word
nnoremap <Leader><space> :nohl<cr>

" prev file
nnoremap <leader>P <C-^>
