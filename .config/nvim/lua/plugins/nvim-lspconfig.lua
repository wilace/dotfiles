local function on_attach(event)
    local bufmap = function(mode, lhs, rhs, desc)
        local opts = { buffer = event.buf, desc = desc }
        vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- You can search each function in the help page.
    -- For example :help vim.lsp.buf.hover()

    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover documentation')
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to definition')
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go to declaration')
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Go to implementation')
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Go to type definition')
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', 'Go to reference')
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Show function signature')
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename symbol')
    bufmap({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', 'Format buffer')
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Execute code action')
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', 'Show line diagnostic')
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', 'Previous diagnostic')
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', 'Next diagnostic')
end

return {
    -- Spec source
    'neovim/nvim-lspconfig',

    -- Spec Loading
    dependencies = {
        -- mason.nvim
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- nvim-cmp
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',

        -- none-ls
        {
            'nvimtools/none-ls.nvim',
            dependencies = { 'nvim-lua/plenary.nvim' },
        },

        -- nvim-ufo
        {
            'kevinhwang91/nvim-ufo',
            dependencies = 'kevinhwang91/promise-async',
        },
    },

    -- Spec Setup
    config = function()
        local lspconfig = require('lspconfig')
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- configure nvim-ufo
        lsp_capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        local group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })
        vim.api.nvim_create_autocmd('LspAttach', {
            group = group,
            desc = 'LSP actions',
            callback = on_attach,
        })

        -- soetup mason.nvim
        local handlers = {
            function(server_name)
                lspconfig[server_name].setup({ capabilities = lsp_capabilities })
            end,
        }
        require('mason').setup()
        require('mason-lspconfig').setup({ handlers = handlers })
        require('ufo').setup()

        -- setup linter
        local null_ls = require('null-ls')
        null_ls.setup({
            sources = { null_ls.builtins.formatting.stylua },
        })
    end,

    -- Spec Lazy Loading
    lazy = false,
}
