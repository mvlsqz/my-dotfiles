require'colorizer'.setup()
require'colorbuddy'.colorscheme('gloombuddy')

vim.api.nvim_set_keymap(
    't',
    '<Esc><Esc>',
    "<C-\\><C-n>",
    {noremap = true, silent = true}
)
