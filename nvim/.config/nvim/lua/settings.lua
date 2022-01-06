vim.cmd('syntax on')
vim.cmd('filetype indent on')
vim.cmd('filetype plugin on')
vim.cmd('set iskeyword+=-')
vim.cmd('set shortmess+=c')

-- vim.o.formatoptions="jcroql"
vim.o.hidden = true
vim.wo.wrap = false
vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"

vim.o.cmdheight = 2
-- vim.o.mouse="a"

vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.splitright = true
vim.o.conceallevel = 0
vim.cmd('set ts=2')
vim.cmd('set sw=2')
-- vim.bo.expandtab = true
-- vim.bo.smartindent = true
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.cursorline = true
-- vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.wo.signcolumn = "yes"
vim.o.updatetime = 200
vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
