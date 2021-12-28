local au = require('au')

au({ 'TermOpen' }, {
    '*',
    function()
      vim.wo.relativenumber = false
      vim.wo.number = false
    end,
})

au({'TermOpen'},
    '*',
    function()
        vim.api.nvim_buf_set_keymap(
            0,
            'tnoremap',
            '<Esc>',
            '<c-\><c-n>'
        )
    end
)

au({'BufNewFile', 'BufRead'}, {
    '*.tf,*.tfvars.*,*.tfvars',
    function()
      vim.bo.filetype = 'hcl'
    end
})
