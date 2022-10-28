vim.cmd([[
	autocmd!
	set iskeyword+=-
	set foldmethod=indent
	set nofoldenable

	set list
	set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:↲,precedes:«,extends:»
	set colorcolumn=150

	set breakindent
	set breakindentopt=shift:2
	set showbreak=\\\\\ space
	set showbreak=↳
]])

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop =  2
vim.opt.expandtab = true

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.scrolloff = 10

vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smartcase = true
-- vim.opt.smarttab = true
vim.opt.breakindent = true
-- vim.opt.shiftwidth = 2
-- vim.opt.tabstop = 2
-- vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumheight = 10
vim.opt.background = 'dark'

vim.opt.pumblend = 5
vim.opt.numberwidth = 4
vim.opt.mouse = ""
