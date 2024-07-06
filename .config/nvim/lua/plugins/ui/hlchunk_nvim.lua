return {
    'shellRaining/hlchunk.nvim',

    event = { 'BufReadPre', 'BufNewFile' },

    opts = function()
        local nvim_get_hl = vim.api.nvim_get_hl

        return {
            chunk = {
                enable = true,
                style = {
                    { fg = '#a093c7' },
                    { fg = nvim_get_hl(0, { name = 'ErrorMsg' }).fg },
                },
                use_treesitter = false,
                max_file_size = 1048576, -- 1024 * 1024
            },

            indent = { enable = false },
            line_num = { enable = false },
            blank = { enable = false }
        }
    end,
}
