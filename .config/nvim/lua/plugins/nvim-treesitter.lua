local Plugin = { 'nvim-treesitter/nvim-treesitter' }

Plugin.lazy = false
Plugin.build = ':TSUpdate'

Plugin.opts = {
  ensure_installed = { 'bash', 'vimdoc', 'lua' },
  sync_install = true,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
}

return Plugin
