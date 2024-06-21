return {
    -- Spec Source
    'neanias/everforest-nvim',

    -- Spec Loading
    enabled = false,
    priority = 1000,

    -- Spec Setup
    config = function()
        require('everforest').setup()
        vim.cmd.colorscheme('everforest')
    end,

    -- Spec Lazy Loading
    lazy = false,

    -- Spec Versioning
    version = false,
}
