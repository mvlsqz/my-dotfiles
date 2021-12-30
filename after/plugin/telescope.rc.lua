require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
    project = {
      base_dirs = {
        '~/Desktop/',
        '~/Projects/',
      },
    },
    bookmarks = {
      selected_browser = 'google_chrome',
      url_open_command = 'open',
    }
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('ultisnips')
require('telescope').load_extension('project')
require('telescope').load_extension('bookmarks')

key_mapper('n', '<leader>ff', '<cmd>Telescope find_files theme=dropdown<cr>')
key_mapper('n', '<leader>fg', '<cmd>Telescope live_grep theme=dropdown<cr>')
key_mapper('n', '<leader>fb', '<cmd>Telescope buffers theme=dropdown<cr>')
key_mapper('n', '<leader>fh', '<cmd>Telescope help_tags theme=dropdown<cr>')

vim.api.nvim_set_keymap(
    'n',
    '<leader>pjc',
    ":lua require'telescope'.extensions.project.project{}<CR>",
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>bmk',
    ":lua require'telescope'.extensions.bookmarks.bookmarks{}<CR>",
    {noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
  "n",
  "<space>bf",
  "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
  {noremap = true}
)
