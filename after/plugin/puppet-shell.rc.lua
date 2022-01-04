local actions_state = require'telescope.actions.state'
local pickers = require'telescope.pickers'
local finders = require'telescope.finders'
local sorters = require'telescope.sorters'
local dropdown = require'telescope.themes'.get_dropdown()

local function enter()
  local selected = actions_state.get_selected_entry()
  local cmd = 'TermExec cmd=' .. selected[1]
  vim.cmd(cmd)
end


local opts = {
  finder = finders.new_table {
    'gem install bundler',
    'bundle install',
    'bundle exec rake validate && bundle exec rake lint',
    'bundle exec rubocop:auto_correct',
    'bundle exec rake spec_prep',
    'bundle exec rake spec_standalone',
    'bundle exec rake beaker',
  },
  sorter = sorters.get_generic_fuzzy_sorter({}),

  attach_mappings = function(prompt_bufnr, map)
    map('i', '<CR>', enter())
    return true
  end,
}

Puppshell = pickers.new(dropdown, opts)
