return {
    {
        -- Spec Source
        'folke/lazydev.nvim',

        -- Spec Setup
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = 'luvit-meta/library', words = { 'vim%.uv' } },
            },
        },

        -- Spec Lazy Loading
        ft = 'lua', -- only load on lua files
    },

    { 'Bilal2453/luvit-meta', lazy = true }, -- optional `vim.uv` typings

    { -- optional completion source for require statements and module annotations

        -- Spec Source
        'hrsh7th/nvim-cmp',

        -- Spec Setup
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = 'lazydev',
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
    },
}
