return {
    'hrsh7th/nvim-cmp',
    version = false,
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'prabirshrestha/vim-lsp',

        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

        'onsails/lspkind.nvim',
    },

    opts = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')
        local auto_select = true

        return {
            completion = {
                completeopt = 'menu,menuone,noinsert' .. (auto_select and '' or ',noselect'),
            },
            preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'vim_lsp' },
            }),
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol',
                    maxwidth = 50,
                    ellipsis_char = '...',
                    show_labelDetails = true,
                })
            },
        }
    end,
}
