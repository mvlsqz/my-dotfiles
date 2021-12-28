require'colorizer'.setup()
require'colorbuddy'.colorscheme('gloombuddy')

vim.api.nvim_buf_set_keymap(
    0,
    't',
    '<Esc><Esc>',
    "<C-\\><C-n>",
    {noremap = true, silent = true}
)
