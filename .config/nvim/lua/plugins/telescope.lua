return {
    -- Spec Source
    'nvim-telescope/telescope.nvim',

    --Spec Loading
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    -- Spec Setup
    config = function()
        local telescope = require('telescope')
        telescope.setup({})
        telescope.load_extension('fzf')
    end,

    -- Spec Lazy Loading
    cmd = 'Telescope',
    keys = {
        { '<leader>ff', require('telescope.builtin').find_files, desc = 'find_files' },
        { '<leader>fg', require('telescope.builtin').live_grep, desc = 'live_grep' },
        { '<leader>fb', require('telescope.builtin').buffers, desc = 'buffers' },
        { '<leader>fh', require('telescope.builtin').help_tags, desc = 'help_tags' }
    },
}
