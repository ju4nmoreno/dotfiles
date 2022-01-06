
local action_state = require('telescope.actions.state')

require('telescope').setup {
    defaults = {
        prompt_prefix = " -> ",
        mappings = {
            i = {
                ['<c-a>'] = function()
                    print(vim.inspect(action_state.get_selected_entry()))
                end
            }
        }
    }
}
local mappings = {}
mappings.curr_buf = function()
local layout_config = {prompt_position = "top"}
    local opt = {sorting_strategy = "ascending"}
    require('telescope.builtin').current_buffer_fuzzy_find(opt, layout_config)
end
return mappings
