return {
    -- Spec Source
    'shellRaining/hlchunk.nvim',

    -- Spec Setup
    opts = {
        chunk = {
            enable = true,
            use_treesitter = false,
            max_file_size = 1048576, -- 1024 * 1024
        },
        indent = {
            enable = true,
            chars = { '│', '¦', '┆', '┊' },
        },
        line_num = { enable = false },
        blank = { enable = false },
    },

    config = true,

    -- Spec Lazy Loading
    event = { 'BufReadPre', 'BufNewFile' },
}
