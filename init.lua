-- Install Packer plugin manager {
  local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  end
-- }

-- START plugins {
  local use = require('packer').use

  require('packer').startup(function()
    -- XXX highlight
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'sheerun/vim-polyglot'

    -- XXX LSP plugins
    use 'neovim/nvim-lspconfig'
    use 'anott03/nvim-lspinstall'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lua" },
        { "ray-x/cmp-treesitter" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-vsnip" },
        { "hrsh7th/vim-vsnip" },
        { "Saecki/crates.nvim" },
        { "f3fora/cmp-spell" },
        -- { "hrsh7th/cmp-cmdline" },
        { "tamago324/cmp-zsh" },
      }
    }
    use 'windwp/nvim-autopairs'
    use 'L3MON4D3/LuaSnip'
    use 'SirVer/ultisnips'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use 'onsails/lspkind-nvim'
    use 'ray-x/lsp_signature.nvim'


    -- START UI {
      -- themes themes
      use 'tjdevries/colorbuddy.nvim'
      use 'bkegley/gloombuddy'
      use 'norcalli/nvim-colorizer.lua'
      use 'kyazdani42/nvim-web-devicons'
      -- Lualine
      use 'nvim-lualine/lualine.nvim'
      use 'kdheepak/tabline.nvim'

      -- Others
      use 'stevearc/dressing.nvim'
    -- }

    -- Add indentation guides even on blank lines
    use 'lukas-reineke/indent-blankline.nvim'

    -- Ultisnips sources {
      use 'andrewstuart/vim-kubernetes'
    -- }

    -- sneaking some formatting in here too
    use {'prettier/vim-prettier', run = 'yarn install'}

    -- Markdown utilities
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}


    -- teminal
    use 'akinsho/toggleterm.nvim'

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'fhill2/telescope-ultisnips.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-telescope/telescope-project.nvim'
    use 'dhruvmanila/telescope-bookmarks.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- Add git related info in the signs columns and popups
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  end)
-- }

-- START Vim Basic settings {
  vim.bo.autoindent = true
  vim.bo.smartindent = true
  vim.bo.swapfile = false
  vim.g.python3_host_prog = os.getenv('PYTHON3_NEOVIM_PATH')
  vim.g.python_host_prog = os.getenv('PYTHON2_NEOVIM_PATH')
  vim.o.backup = false
  vim.o.breakindent = true
  vim.o.completeopt = 'menu,menuone,noselect'
  vim.o.errorbells = false
  vim.o.expandtab = true
  vim.o.hlsearch = false
  vim.o.ignorecase = true
  vim.o.incsearch = true
  vim.o.mouse = 'a'
  vim.o.shiftwidth = 2
  vim.o.showmode = false
  vim.o.signcolumn = 'yes'
  vim.o.smartcase = true
  vim.o.softtabstop = 2
  vim.o.syntax = 'on'
  vim.o.tabstop = 2
  vim.o.termguicolors = true
  vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
  vim.o.undofile = true
  vim.o.updatetime = 250
  vim.wo.number =true
  vim.wo.relativenumber =true
  vim.wo.signcolumn = 'yes'
  vim.wo.wrap = false

-- } END Vim Basic settings

-- START remap <Space> as leader {
  vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
-- } END remap <Space> as leader

-- START aucmds and augroups {
  local au = require('au')
  -- Start cmds {
    -- disable numbers for terminal
    au({ 'TermOpen', 'TermEnter' }, {
        '*',
        function()
          vim.wo.relativenumber = false
          vim.wo.number = false
        end,
    })
    -- enable numbers on active Tabs/Windows
    au({ 'TabEnter', 'WinEnter' }, {
        '*',
        function()
          vim.wo.relativenumber = true
          vim.wo.number = true
        end,
    })
  -- }

  -- Start augroups {
    -- highlight on yank
    au.group('YankHighlight', {
        { 'TextYankPost', '*', 'silent! lua vim.highlight.on_yank()' }
    })
    -- compile init.lua on save
    au.group('Packer',{
        { 'BufWritePost', 'init.lua', 'PackerCompile' }
    })
  -- }

  -- Start Filetypes {
    -- set hcl to Terraform files
    au({'BufNewFile', 'BufRead'}, {
        '*.tf,*.tfvars.*,*.tfvars',
        function()
          vim.bo.filetype = 'hcl'
        end
    })
  -- }
-- }

Key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

Key_mapper('', '<up>', '<noop>')
Key_mapper('', '<down>', '<noop>')
Key_mapper('', '<left>', '<noop>')
Key_mapper('i', 'jk', '<ESC>')
Key_mapper('i', 'JK', '<ESC>')
Key_mapper('i', 'jK', '<ESC>')
Key_mapper('v', 'jk', '<ESC>')
Key_mapper('v', 'JK', '<ESC>')
Key_mapper('v', 'jK', '<ESC>')
