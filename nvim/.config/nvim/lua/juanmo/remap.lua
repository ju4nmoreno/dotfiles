vim.opt.clipboard:append({ "unnamedplus" })

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Basics keys
vim.keymap.set("n", "<leader>s", ":wall<CR>")
vim.keymap.set("n", "<leader>qq", ":qall!<CR>")
vim.keymap.set("n", "<leader>q", ":q!<CR>")

vim.keymap.set("n", "x", '"_x')

-- Increment/Decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- vim.keymap.set("n", "<Space>", "<C-w>w")
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- Split window
vim.keymap.set("n", "sh", ":split<Return><C-w>w")
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w")

vim.keymap.set("n", "<C-s>", ":nohlsearch<CR>")
vim.keymap.set("n", "<C-j>", ":resize -2<CR>")
vim.keymap.set("n", "<C-k>", ":resize +2<CR>")
vim.keymap.set("n", "<C-l>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-h>", ":vertical resize +2<CR>")

-- fugitive
vim.keymap.set("n", "<leader>gh", ":diffget //2<CR>")
vim.keymap.set("n", "<leader>gu", ":diffget //3<CR>")

-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv")

vim.keymap.set("v", "p", '"_dP')

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
