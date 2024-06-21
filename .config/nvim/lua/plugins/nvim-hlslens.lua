local kopts = { remap = false, silent = true }
return {
    -- Spec Source
    'kevinhwang91/nvim-hlslens',

    -- Spec Loading
    dependencies = {
        {
            'kevinhwang91/nvim-ufo',
            dependencies = 'kevinhwang91/promise-async',
            config = true,
        },
    },

    -- Spec Setup
    config = true,

    -- Spec Lazy Loading
    keys = {
        {
            'n',
            [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
            kopts,
        },
        {
            'N',
            [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
            kopts,
        },
        {
            '*',
            [[*<Cmd>lua require('hlslens').start()<CR>]],
            kopts,
        },
        {
            '#',
            [[#<Cmd>lua require('hlslens').start()<CR>]],
            kopts,
        },
        {
            'g*',
            [[g*<Cmd>lua require('hlslens').start()<CR>]],
            kopts,
        },
        {
            'g#',
            [[g#<Cmd>lua require('hlslens').start()<CR>]],
            kopts,
        },
        {
            '<Leader>L',
            '<Cmd>noh<CR>',
            kopts,
        },
    },
}
