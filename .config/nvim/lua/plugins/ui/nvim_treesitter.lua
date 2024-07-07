return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' },
    lazy = vim.fn.argc(-1) == 0,

    opts = {
          ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'cpp' },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
    },

    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
}
