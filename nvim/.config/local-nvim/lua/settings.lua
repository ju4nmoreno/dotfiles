vim.cmd [[
syntax on

filetype indent on
filetype plugin on

set iskeyword+=-
set shortmess+=c
set whichwrap+=<,>,[,],h,l
set ts=2
set sw=2

]]

-- vim.o.formatoptions="jcroql"
vim.o.hidden = true
vim.wo.wrap = false
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"
vim.o.scrolloff = 10

vim.o.cmdheight = 2
-- vim.o.mouse="a"

vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.splitright = true
vim.o.conceallevel = 0
-- vim.bo.expandtab = true
-- vim.bo.smartindent = true
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.numberwidth = 6
vim.wo.cursorline = true
-- vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.wo.signcolumn = "yes"
vim.o.updatetime = 200
vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
