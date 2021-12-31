local function current_buffer_number()
  return "﬘ " .. vim.api.nvim_get_current_buf()
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local function current_date()
  return string.sub(os.date "%x", 1, 5)
end

local function current_working_dir()
  local cwd = string.sub(vim.fn.getcwd(), 12)
  return "~" .. cwd
end

-- stylua: ignore
local colors = {
  blue   = '#7aa5ff',
  cyan   = '#2de0a7',
  black  = '#212136',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#ae81ff',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = {
      { "b:gitsigns_head", icon = "" },
      { "diff", source = diff_source },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}
      },
    },

    lualine_c = { { "filename", path = 1, symbols = { modified = "[]", readonly = " " } } },
    lualine_x = { { "filetype", icon_only = true } },
    lualine_y = { { current_buffer_number }, { current_working_dir }, { current_date } },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { "filename", path = 1, symbols = { modified = "[]", readonly = " " } } },
    lualine_x = { "location" },
    lualine_y = { { current_buffer_number } },
    lualine_z = {},
  },
  tabline = {},
  extensions = {'toggleterm'},
}
