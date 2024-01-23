require('telescope').setup({ file_ignore_patterns = { "node%_modules/.*" } })
local builtin = require('telescope.builtin')
local telescope_state = require('telescope.state')

local last_search = nil

function search_with_cache()
  if last_search == nil then
    builtin.live_grep()

    local cached_pickers = telescope_state.get_global_key "cached_pickers" or {}
    last_search = cached_pickers[1]
  else
    builtin.resume({ picker = last_search })
  end
end

vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', search_with_cache, {})
vim.keymap.set('n', '<Space>ff', builtin.find_files, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
