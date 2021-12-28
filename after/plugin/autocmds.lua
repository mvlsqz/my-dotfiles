local au = require('au')

au({ 'TermOpen' }, {
    '*',
    function()
      vim.wo.relativenumber = false
      vim.wo.number = false
    end,
})
au({ 'TermClose' }, {
    '*',
    function()
      vim.wo.relativenumber = true
      vim.wo.number = true
    end,
})
au({'BufNewFile', 'BufRead'}, {
    '*.tf,*.tfvars.*,*.tfvars',
    function()
      vim.bo.filetype = 'hcl'
    end
})
