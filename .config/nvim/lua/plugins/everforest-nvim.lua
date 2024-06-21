local Plugin = { 'neanias/everforest-nvim' }

Plugin.lazy = false
Plugin.priority = 1000

-- Optional; default configuration will be used if setup isn't called.
Plugin.opts = {
  background = 'hard',
  disable_italic_comments = true,
  ui_contrast = 'high',
  diagnostic_text_highlight = true,
  diagnostic_line_highlight = true,

  on_highlights = function(hl, palette)
    -- configure gitsigns
    hl.GitSignsAddLnInline = {
      fg = palette.none,
      bg = palette.none,
      underline = true,
    }
    hl.GitSignsChangeLnInline = {
      fg = palette.none,
      bg = palette.none,
      underline = true,
    }
    hl.GitSignsDeleteLnInline = {
      fg = palette.purple,
      bg = palette.none,
      underline = true,
      bold = true,
    }
  end,
}

Plugin.config = function(_, opts)
  local main_module = require('everforest')
  main_module.setup(opts)
  main_module.load()
end

return Plugin
