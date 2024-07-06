return {
    'kevinhwang91/nvim-hlslens',

    keys = {
        {
            'n',
            [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
            { remap = false, silent = true }
        },
        {
            'N',
            [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
            { remap = false, silent = true }
        },
        { '*', [[*<Cmd>lua require('hlslens').start()<CR>]], { remap = false, silent = true } },
        { '#', [[#<Cmd>lua require('hlslens').start()<CR>]], { remap = false, silent = true } },
        { 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], { remap = false, silent = true } },
        { 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], { remap = false, silent = true } },
        { '<Leader>L', '<Cmd>noh<CR>', { remap = false, silent = true } }
    },

    config = true,
}
