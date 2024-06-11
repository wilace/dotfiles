local keymap_tables = {
 -- { mode, key_to_be_set, executive_command, optional_arguments }

    { 'i', 'jk', '<Esc>', { noremap = true }},

    { 'n', '<Leader>h', '0', { noremap = true }},
    { 'n', '<Leader>l', '$', { noremap = true }},
}


vim.api.nvim_set_var('mapleader', ' ')
vim.api.nvim_set_var('maplocalleader', '\\')

for _, keymap_table in pairs(keymap_tables) do
    vim.api.nvim_set_keymap( unpack(keymap_table) )
end

