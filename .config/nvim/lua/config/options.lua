local options = {
 -- { name, value, opts }

    { 'tabstop', 4, {} },
    { 'shiftwidth', 0, {} },
    { 'expandtab', true, {} },

    { 'number', true, {} },
}


local length = #options
local nvim_set_option_value = vim.api.nvim_set_option_value

for i=1, length do
    local option = options[i]
    nvim_set_option_value(
        option[1],  -- name
        option[2],  -- value
        option[3]   -- opts
    )
end
