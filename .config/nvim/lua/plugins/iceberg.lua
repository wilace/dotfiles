return {
    -- Spec Source
    'cocopon/iceberg.vim',

    -- Spec Loading
    enabled = true,
    priority = 1000,

    -- Spec Setup
    config = function ()
        vim.cmd.colorscheme('iceberg')
    end,

    -- Spec Lazy Loading
    lazy = false,
}
