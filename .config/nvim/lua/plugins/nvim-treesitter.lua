return {
    -- Spec Source
    'nvim-treesitter/nvim-treesitter',

    -- Spec Setup
    opts = {
        auto_install = false,
    },

    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,

    build = ':TSUpdate',

    -- Spec Lazy Loading
    lazy = false,
}
