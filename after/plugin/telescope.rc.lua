require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
    ultisnips = {},
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('ultisnips')

key_mapper('n', '<leader>ff', '<cmd>Telescope find_files theme=dropdown<cr>')
key_mapper('n', '<leader>fg', '<cmd>Telescope live_grep theme=dropdown<cr>')
key_mapper('n', '<leader>fb', '<cmd>Telescope buffers theme=dropdown<cr>')
key_mapper('n', '<leader>fh', '<cmd>Telescope help_tags theme=dropdown<cr>')