local Plugin = { 'nvim-tree/nvim-tree.lua' }

Plugin.dependencies = {
  'nvim-tree/nvim-web-devicons',
  'nvim-telescope/telescope.nvim'
}
Plugin.lazy = false

Plugin.opts = {
  sort = {
    sorter = "extension",
  },
  view = {
    width = '20%',
    side = 'right',
    signcolumn = 'no',
  },
  renderer = {
    highlight_git = true,
    highlight_opened_files = 'name',
    icons = {
      glyphs = {
        git = {
          unstaged = '!', renamed = '»', untracked = '?', deleted = '✘',
          staged = '✓', unmerged = '', ignored = '◌',
        },
      },
    },
  },
  actions = {
    expand_all = {
      max_folder_discovery = 100,
      exclude = { '.git', 'target', 'build' },
    },
  },
  on_attach = 'default'
}

function Plugin.config(_, opts)
  require('nvim-tree').setup(opts)
  vim.keymap.set('n', '<leader>ex', vim.cmd.NvimTreeToggle)
end

return Plugin

