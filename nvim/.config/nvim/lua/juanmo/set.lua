vim.cmd([[
  filetype on
  filetype plugin on
  filetype indent on
  " let g:netrw_keepdir = 0
  autocmd!
  set iskeyword+=-
  set foldmethod=indent
  set nofoldenable

  set list
  set listchars=tab:⤚\ ,space:·,nbsp:␣,trail:•,eol:↲,precedes:«,extends:»
  set colorcolumn=150

  set breakindent
  set breakindentopt=shift:2
  set showbreak=\\\\\ space
  set showbreak=↳
  set signcolumn=yes
  set autoindent
  set cindent
  " set smartindent
]])

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.scrolloff = 10

vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true

vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumheight = 10
vim.opt.background = "dark"

vim.opt.pumblend = 5
vim.opt.numberwidth = 6
vim.opt.mouse = ""

vim.opt.swapfile = false
vim.opt.backup = false

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- vim.opt.undotree = os.getenv("HOME") .. "/.vim/undodir"
vim.cmd([[
if has("persistent_undo")
   let target_path = expand('~/.vim/undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif
]])
