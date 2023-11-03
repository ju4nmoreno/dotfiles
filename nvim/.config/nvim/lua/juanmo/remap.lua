local keymap = vim.keymap
vim.opt.clipboard:append({ "unnamedplus" })

keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.g.mapleader = " "
keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Basics keys
keymap.set("n", "<leader>s", ":wall<CR>")
keymap.set("n", "<leader>qq", ":qall!<CR>")
keymap.set("n", "<leader>q", ":q!<CR>")
-- select all

keymap.set("n", "x", '"_x')

-- Increment/Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

keymap.set("n", "<Space>", "<C-w>w")
keymap.set("n", "<leader>h", "<C-w>h")
keymap.set("n", "<leader>k", "<C-w>k")
keymap.set("n", "<leader>j", "<C-w>j")
keymap.set("n", "<leader>l", "<C-w>l")

-- Split window
keymap.set("n", "sh", ":split<Return><C-w>w", { silent = true })
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })

keymap.set("n", "<C-s>", ":nohlsearch<CR>")
keymap.set("n", "<C-j>", ":resize -2<CR>")
keymap.set("n", "<C-k>", ":resize +2<CR>")
keymap.set("n", "<C-l>", ":vertical resize -2<CR>")
keymap.set("n", "<C-h>", ":vertical resize +2<CR>")

-- fugitive
keymap.set("n", "<leader>gh", ":diffget //2<CR>")
keymap.set("n", "<leader>gu", ":diffget //3<CR>")

-- Move text up and down
keymap.set("x", "J", ":move '>+1<CR>gv-gv")
keymap.set("x", "K", ":move '<-2<CR>gv-gv")
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv")

keymap.set("v", "p", '"_dP')

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
