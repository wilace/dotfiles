return {
    -- Spec Source
    'nvim-lualine/lualine.nvim',

    -- Spec Loading
    dependencies = { 'nvim-tree/nvim-web-devicons', config = true },

    -- Spec Setup
    config = function()
        local nvim_set_var = vim.api.nvim_set_var
        nvim_set_var('showmode', false)

        require('lualine').setup({})
    end,

    -- Spec Lazy Loading
    lazy = false,
}
