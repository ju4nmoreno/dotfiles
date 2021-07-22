vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Disable arrow keys
map  <up>    :echoerr "What are you doing? up"<cr>
map  <down>  :echoerr "What are you doing?" down"<cr>
map  <left>  :echoerr "What are you doing? <- ------- ----- --- "<cr>
map  <right> :echoerr "What are you doing? -> ------------------"<cr>

nnoremap <silent><leader>w :w<CR>
nnoremap <leader>s :wall<CR>
vnoremap <leader>s :wall<CR>

map <silent><leader>q :bd<cr>
map <silent><leader>x :x<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<CR><C-w>h :Ex <bar> :vertical resize 30<CR>

nnoremap <leader>y :let @a='"+yy'<CR>
vnoremap <leader>y :let @a='"+yy'<CR>

vnoremap <leader>ay "ay
vnoremap <leader>ap "ap

inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap ` ``<Esc>i

" Find files using Telescope command-line sugar.
nnoremap <leader>t :Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>p <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <C-_> :Telescope current_buffers_fuzzy_find<cr>
" nnoremap <leader>/ :Telescope current_buffers_fuzzy_find <cr>

nnoremap <Leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +10<CR>
nnoremap <Leader>- :vertical resize -10<CR>
nnoremap <Leader>i <C-w>=
nnoremap <Leader>z <C-w><bar>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
nnoremap <Leader>m :tabe <bar> :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>e :Ex<CR>
nnoremap <Leader>o :only<CR>
" nnoremap <Leader>b :Buffers<CR>

highlight LineNr ctermfg=blue ctermbg=blue

" git diff 
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2
nmap <leader>gs :G<CR>
