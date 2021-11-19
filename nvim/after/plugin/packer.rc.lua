local use = require('packer').use

require('packer').startup(function()
  -- awesome plugins here
  -- XXX highlight 
  use 'nvim-treesitter/nvim-treesitter'
  use 'sheerun/vim-polyglot'

  -- XXX LSP plugins
  use 'neovim/nvim-lspconfig'
  use 'anott03/nvim-lspinstall'

  -- XXX Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- ultisnip FTW!
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'

  -- themes themes
  use 'tjdevries/colorbuddy.nvim'
  use 'bkegley/gloombuddy'

  -- Ultisnips
  use 'andrewstuart/vim-kubernetes'

  -- sneaking some formatting in here too
  use {'prettier/vim-prettier', run = 'yarn install'}

  -- Markdown utilities
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}

  -- Lualine
  use 'hoob3rt/lualine.nvim'

  -- webdevicons
  use 'kyazdani42/nvim-web-devicons'
end)
