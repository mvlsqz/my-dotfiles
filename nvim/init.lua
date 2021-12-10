vim.g.python_host_prog = '/home/marvinv/.conda/envs/nvim2/bin/python'
vim.g.python3_host_prog = '/home/marvinv/.conda/envs/nvim3/bin/python'
vim.o.termguicolors = true
vim.o.syntax = 'on'
vim.o.errorbells = false
vim.o.smartcase = true
vim.o.showmode = false
vim.bo.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true
vim.o.incsearch = true
vim.o.completeopt = 'menu,menuone,noselect'
vim.bo.autoindent = true
vim.bo.smartindent = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.wo.number =true
vim.wo.relativenumber =true
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false

--- Mapping leader to space ---
vim.g.mapleader = ' '
--- Default theme ---
vim.g.colors_name = 'gloombuddy' 

local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  ) 
end

key_mapper('', '<up>', '<noop>')
key_mapper('', '<down>', '<noop>')
key_mapper('', '<left>', '<noop>')
key_mapper('i', 'jk', '<ESC>')
key_mapper('i', 'JK', '<ESC>')
key_mapper('i', 'jK', '<ESC>')
key_mapper('v', 'jk', '<ESC>')
key_mapper('v', 'JK', '<ESC>')
key_mapper('v', 'jK', '<ESC>')
key_mapper('n', '<SPACE>ft', ':NvimTreeToggle<CR>')

local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end


vim.cmd('packadd packer.nvim')

local packer = require'packer'
local util = require'packer.util'


packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
