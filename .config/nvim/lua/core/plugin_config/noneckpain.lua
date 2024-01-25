require("no-neck-pain").setup({
    width = 160,
    buffers = {
        colors = {
          background = "#111111",
        },
        wo = {
            fillchars = "eob: ",
        },
    },
})

vim.keymap.set('n', '<c-_>', ':NoNeckPain<CR>')

