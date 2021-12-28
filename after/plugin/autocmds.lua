local au = require('au')

au({ 'TermOpen', 'TermEnter' }, {
    '*',
    function()
      vim.wo.relativenumber = false
      vim.wo.number = false
    end,
})
au({ 'TermClose', 'TermLeave' }, {
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
