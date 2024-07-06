return {
    'monaqa/dial.nvim',
    event = 'VeryLazy',

    init = function(plugin_spec)
        vim.api.nvim_create_augroup('dial', {})
        vim.api.nvim_create_autocmd('FileType', {
            group = 'dial',
            pattern = 'lua',
            callback = function()
                local buf_set_keymap = vim.api.nvim_buf_set_keymap
                buf_set_keymap(0, 'n', '<C-a>', require('dial.map').inc_normal('lua'), { noremap = true, desc = 'Increment' })
                buf_set_keymap(0, 'n', '<C-x>', require('dial.map').dec_normal('lua'), { noremap = true, desc = 'Decrement' })
                buf_set_keymap(0, 'n', 'g<C-a>', require('dial.map').inc_gnormal('lua'), { noremap = true, desc = 'Increment' })
                buf_set_keymap(0, 'n', 'g<C-x>', require('dial.map').dec_gnormal('lua'), { noremap = true, desc = 'Decrement' })
            end,
        })
    end,

    opts = function()
        local augend = require('dial.augend')

        return {
            groups = {
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias["%Y/%m/%d"],
                },
                lua = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias["%Y/%m/%d"],
                    augend.constant.alias.bool,
                    augend.constant.new({
                        elements = { 'and', 'or' },
                        word = true,
                        cyclic = true
                    })
                },
            },
        }
    end,

    config = function(_, opts)
        require('dial.config').augends:register_group(opts.groups)

        local set = vim.api.nvim_set_keymap
        set('n', '<C-a>', require('dial.map').inc_normal(), { noremap = true, desc = 'Increment' })
        set('n', '<C-x>', require('dial.map').dec_normal(), { noremap = true, desc = 'Decrement' })
        set('n', 'g<C-a>', require('dial.map').inc_gnormal(), { noremap = true, desc = 'Increment' })
        set('n', 'g<C-x>', require('dial.map').dec_gnormal(), { noremap = true, desc = 'Decrement' })
    end,
}
