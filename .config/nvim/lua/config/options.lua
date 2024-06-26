local M = {}

function M.load_options()
  local options = {
    -- { name, value, opts }

    { 'termguicolors', true, {} },
    { 'mouse', '', {} },

    { 'tabstop', 2, {} },
    { 'shiftwidth', 0, {} },
    { 'expandtab', true, {} },

    { 'textwidth', 100, {} },
    { 'ignorecase', true, {} },
    { 'smartcase', true, {} },
    { 'inccommand', 'split', {} },

    { 'number', true, { scope = 'local', win = 0 } },
    { 'signcolumn', 'yes', { scope = 'local', win = 0 } },
    { 'scrolloff', 10, { scope = 'local', win = 0 } },
  }

  local nvim_set_var = vim.api.nvim_set_var
  nvim_set_var('loaded_netrw', 1)
  nvim_set_var('loaded_netrwPlugin', 1)

  local array_length = #options
  local nvim_set_option_value = vim.api.nvim_set_option_value

  for i = 1, array_length do
    local option = options[i]
    nvim_set_option_value(
      option[1], -- name
      option[2], -- value
      option[3] -- opts
    )
  end
end

return M

--[[
    list of items to be set.
]]
