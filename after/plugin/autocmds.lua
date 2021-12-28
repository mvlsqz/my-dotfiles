local au = require('au')

au({ 'TermOpen' }, {
    '*',
    function()
      vim.wo.relativenumber = false
      vim.wo.number = false
    end,
})

au({'BufNewFile', 'BufRead'}, {
    '*.tf,*.tfvars.*,*.tfvars',
    function()
      vim.bo.filetype = 'hcl'
    end
})
