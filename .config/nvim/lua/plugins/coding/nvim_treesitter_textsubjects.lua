return {
    'RRethy/nvim-treesitter-textsubjects',
    event = 'VeryLazy',

    opts = {
        textsubjects = {
            enable = true,
            prev_selection = ',', -- (Optional) keymap to select the previous selection
            keymaps = {
                ['.'] = 'textsubjects-smart',
                [';'] = 'textsubjects-container-outer',
                ['i;'] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
            },
        },
    },

    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
}
