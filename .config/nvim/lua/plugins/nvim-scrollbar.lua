local Plugin = { 'petertriho/nvim-scrollbar' }

Plugin.dependencies = {
  'lewis6991/gitsigns.nvim',
  'kevinhwang91/nvim-hlslens',
}
Plugin.lazy = false
Plugin.config = true

return Plugin
