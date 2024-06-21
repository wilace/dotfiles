return {
    -- Spec Source
    'kevinhwang91/nvim-ufo',

    -- Spec Loading
    dependencies = {
        'kevinhwang91/promise-async',
    },

    -- Spec Setup
    config = function()
        local nvim_set_option_value = vim.api.nvim_set_option_value
        nvim_set_option_value('foldcolumn', '1', {})
        nvim_set_option_value('foldlevel', 99, {})
        nvim_set_option_value('foldlevelstart', 99, {})
        nvim_set_option_value('foldenable', true, {})

        local keymap_set = vim.keymap.set
        keymap_set('n', 'zR', require('ufo').openAllFolds)
        keymap_set('n', 'zM', require('ufo').closeAllFolds)
    end,

    -- Spec Lazy Loading
    lazy = false,
}
