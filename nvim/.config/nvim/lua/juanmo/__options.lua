vim.cmd([[
	autocmd!
	set iskeyword+=-
	set foldmethod=indent
]])

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'


local options = {
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines

	autoindent = true,
	smartindent = true, -- make indenting smarter again

	hlsearch = true, -- highlight all matches on previous search pattern
	backup = false,
	showcmd = true,
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	laststatus = 2,
	expandtab = false, -- convert tabs to spaces
	sidescrolloff = 10,
	ignorecase = true, -- ignore case in search patterns

	smartcase = true, -- smart case
	breakindent = true,
	-- shiftwidth = 2,                          -- the number of spaces inserted for each indentation
	-- tabstop = 2,                             -- insert 2 spaces for a tab

	wrap = false, -- display lines as one long line
	backspace = { 'start', 'eol', 'indent' },


	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	-- mouse = "a",                             -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	-- showtabline = 2,                         -- always show tabs
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	-- timeoutlen = 600, -- time to wait for a mapped sequence to complete (in milliseconds)
	-- undofile = true, -- enable persistent undo
	-- updatetime = 200, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	cursorline = true, -- highlight the current line
	-- numberwidth = 4,                         -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	--
	title = true,
	scrolloff = 10,
}

vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- let g:netrw_browse_split = 4
-- let g:netrw_liststyle = 3

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'



vim.cmd("autocmd!")

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
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
