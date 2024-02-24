require('telescope').setup({
  file_ignore_patterns = { "node%_modules/.*" },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "-g", "!.git" }
    },
  }
})
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>ff', builtin.find_files, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
