return {
    'nvimtools/none-ls.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    event = 'VeryLazy',

    opts = function ()
        local null_ls = require('null-ls')

        return {
            sources = {
                null_ls.builtins.formatting.stylua,
            }
        }
    end,
}
