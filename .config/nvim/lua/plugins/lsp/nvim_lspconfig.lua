return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    dependencies = {
        'williamboman/mason.nvim',
        { 'williamboman/mason-lspconfig.nvim', config = function() end },

        {
            'nvimdev/lspsaga.nvim',
            dependencies = {
                'nvim-treesitter/nvim-treesitter',
                'nvim-tree/nvim-web-devicons'
            }
        },
        'hrsh7th/cmp-nvim-lsp'
    },

    opts = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        return {
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({
                        capabilities = capabilities
                    })
                end,
            },
        }
    end,

    config = function(_, opts)
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(ctx)
                local set = vim.keymap.set
                set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { buffer = true })
                set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { buffer = true })
                set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer = true })
                set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { buffer = true })
                set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = true })
                set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', { buffer = true })
                set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', { buffer = true })
                set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { buffer = true })
                set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { buffer = true })
                set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { buffer = true })
                set('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { buffer = true })
                set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { buffer = true })
                set('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { buffer = true })
                set('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { buffer = true })
                set('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { buffer = true })
                set('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', { buffer = true })
                set('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', { buffer = true })
            end,
        })

        require('mason').setup()
        require('mason-lspconfig').setup()
        require('mason-lspconfig').setup_handlers(opts.handlers)
    end,
}
