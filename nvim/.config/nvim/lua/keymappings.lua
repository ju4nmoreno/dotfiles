
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true})

vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>e', ':Exp<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>s', ':wall<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-s>', '<esc>:w<CR>i', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>q', ':q!<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>qq', ':qall!<CR>', { noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>t', ':Telescope <CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>p', ':Telescope git_files<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-_>', '<cmd>lua require("nv-telescope").curr_buf()<CR>', { noremap = true, silent = true})

vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-j>', '<esc>:m .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<esc>:m .-2<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>j', '<esc>:m .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>k', '<esc>:m .-2<CR>==', {noremap = true, silent = true})


vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true, silent = true})


vim.api.nvim_set_keymap('n', 'n', 'nzzzv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', {noremap = true, silent = true})

vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>P', '"+p', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<leader>yy', '"ay', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>pp', '"ap', {noremap = true, silent = true})


