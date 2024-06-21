return {
    -- Spec Source
    'nvim-tree/nvim-tree.lua',

    -- Spec Loading
    dependencies = { 'nvim-tree/nvim-web-devicons', config = true },

    -- Spec Setup
    config = true,

    -- Spec Lazy Loading
    keys = {
        { '<leader>ex', vim.cmd.NvimTreeToggle, desc = 'NvimTreeToggle' }
    },
}
