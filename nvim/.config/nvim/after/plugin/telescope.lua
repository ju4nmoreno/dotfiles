
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<leader>ps", function()
	vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

