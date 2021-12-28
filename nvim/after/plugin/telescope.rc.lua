require('telescope').load_extension('fzf')


key_mapper('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
key_mapper('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
key_mapper('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
key_mapper('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
