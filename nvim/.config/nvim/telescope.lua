local action_state = require('telescope.actions.state')

require('nvim-treesitter.configs').setup { highlight = { enable = true } }
require('telescope').setup {}
  -- defaults = {
  --    prompt_prefix = "-- ",
  --    mappings = {
  --      i = {
  --        ['<c-a>'] = function() print(vim.inspect(action_state.get_selected_entry())) end
  --      }
  --    }
  -- }
-- }
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
-- require('telescope').load_extension('fzf')
-- require('telescope').load_extension('coc')

