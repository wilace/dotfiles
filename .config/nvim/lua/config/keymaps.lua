local keymap_tables = {
  -- { mode, setting_key, executive_command, optional_arguments }

  { 'i', 'jk', '<Esc>', { noremap = true } },

  { 'n', '<Leader>h', '0', { noremap = true } },
  { 'n', '<Leader>l', '$', { noremap = true } },
}

local nvim_set_var = vim.api.nvim_set_var
nvim_set_var('mapleader', ' ')
nvim_set_var('maplocalleader', '\\')

local array_length = #keymap_tables
for i = 1, array_length do
  local keymap_table = keymap_tables[i]
  vim.api.nvim_set_keymap(
    keymap_table[1], -- mode
    keymap_table[2], -- setting_key
    keymap_table[3], -- executive_command
    keymap_table[4]  -- optional_arguments
  )
end
