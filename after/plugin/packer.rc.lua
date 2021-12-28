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
  use 'L3MON4D3/LuaSnip'
  -- ultisnip FTW!
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'

  -- themes themes
  use 'tjdevries/colorbuddy.nvim'
  use 'bkegley/gloombuddy'
  use 'norcalli/nvim-colorizer.lua'

  -- Ultisnips
  use 'andrewstuart/vim-kubernetes'

  -- sneaking some formatting in here too
  use {'prettier/vim-prettier', run = 'yarn install'}

  -- Markdown utilities
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}

  -- Lualine
  use 'hoob3rt/lualine.nvim'
  use 'kdheepak/tabline.nvim'

  -- webdevicons
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }

  -- teminal
  use 'akinsho/toggleterm.nvim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim', run = 'make'
  }

  -- Sessions
  use {
    'Shatur/neovim-session-manager',
    requires = {
      'nvim-telescope/telescope.nvim',
    }
  }
end)
