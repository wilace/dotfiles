-- local global_variables = {
--     { 'loaded_netrw', 1 },
--     { 'loaded_netrwPlugin', 1 },
-- }
-- global_variables[0] = 2
--
-- local nvim_set_var = vim.api.nvim_set_var
-- for i = 1, global_variables[0] do
--     local table = global_variables[i]
--     nvim_set_var(table[1], table[2])
-- end

local opts = {}
local option_tables = {
    { 'termguicolors', true, opts },
    { 'mouse', '', opts },

    { 'clipboard', (vim.env.SSH_TTY and '' or 'unnamedplus'), opts },
    { 'confirm', true, opts },
    { 'cursorline', true, opts },
    { 'fillchars', 'foldopen:,foldclose:,fold: ,foldsep: ,diff:╱,eob: ', opts },
    { 'formatoptions', 'tcqj', opts },
    { 'list', true, opts },
    { 'pumblend', 10, opts },
    { 'pumheight', 10, opts },
    { 'shiftround', true, opts },
    { 'shortmess', 'ltToOCFWIc', opts },
    { 'sidescrolloff', 8, opts },
    { 'smartindent', true, opts },
    { 'timeoutlen', 300, opts },
    { 'updatetime', 200, opts },
    { 'virtualedit', 'block', opts },
    { 'winminwidth', 5, opts },
    { 'wrap', false, opts },
    { 'smoothscroll', true, opts },

    { 'tabstop', 4, opts },
    { 'shiftwidth', 0, opts },
    { 'expandtab', true, opts },

    { 'textwidth', 100, opts },
    { 'ignorecase', true, opts },
    { 'smartcase', true, opts },
    { 'inccommand', 'split', opts },
    { 'incsearch', true, opts },

    { 'number', true, opts },
    { 'signcolumn', 'yes', opts },
    { 'scrolloff', 4, opts },
}
option_tables[0] = #option_tables

local nvim_set_option_value = vim.api.nvim_set_option_value
for i = 1, option_tables[0] do
    local option = option_tables[i]
    nvim_set_option_value(option[1], option[2], option[3])
end
