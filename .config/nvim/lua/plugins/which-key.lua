return {
    -- Spec Source
    'folke/which-key.nvim',

    -- Spec Setup
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },

    -- Spec Lazy Loading
    event = 'VeryLazy',
}
