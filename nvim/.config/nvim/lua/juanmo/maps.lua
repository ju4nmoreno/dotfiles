local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

local keyMapOld = vim.keymap

keyMapOld.set('n', 'x', '"_x')

-- Increment/decrement
keyMapOld.set('n', '+', '<C-a>')
keyMapOld.set('n', '-', '<C-x>')

-- Delete a word backwards
keyMapOld.set('n', 'dw', 'vb"_d')

-- Select all
-- keyMapOld.set('n', '<C-A>', 'gg<S-v>G')
keyMapOld.set("x","<leader>p", "\"_dp");

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keyMapOld.set('n', 'te', ':tabedit')
-- Split window
keyMapOld.set('n', 'ss', ':split<Return><C-w>w')
keyMapOld.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keyMapOld.set('n', '<Space>', '<C-w>w')
keyMapOld.set('', 'sh', '<C-w>h')
keyMapOld.set('', 'sk', '<C-w>k')
keyMapOld.set('', 'sj', '<C-w>j')
keyMapOld.set('', 'sl', '<C-w>l')

-- Resize window
keyMapOld.set('n', '<C-w><left>', '<C-w><')
keyMapOld.set('n', '<C-w><right>', '<C-w>>')
keyMapOld.set('n', '<C-w><up>', '<C-w>+')
keyMapOld.set('n', '<C-w><down>', '<C-w>-')

keyMapOld.set('n', '<Space>s', ':w<cr>')
keyMapOld.set('n', '<Space>e', ':Exp<cr>')
-- Resize with arrows
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<leader>h", ":nohlsearch<CR>", opts)
keymap("n", "<leader>e", ":Exp<CR>", opts)
keymap("n", "<leader>s", ":wall!<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":bd!<CR>", opts)
keymap("n", "<leader>qq", ":qall!<CR>", opts)

keymap("n", "<leader>t", ":Telescope<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>lg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>b", ":Telescope buffers<CR>", opts)

-- fugitive
keymap("n", "<leader>gh", ":diffget //2<CR>", opts)
keymap("n", "<leader>gu", ":diffget //3<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
