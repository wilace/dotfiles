local Plugin = { 'kevinhwang91/nvim-hlslens' }
Plugin.lazy = false

Plugin.opts = {
  -- Enable nvim-hlslens automatically
  -- default true
  auto_enable = true,

  --[[
    When `incsearch` option is on and enable_incsearch is true,
      add lens for the current matched instance
  ]]
  -- default true
  enable_incsearch = true,

  --[[
    If calm_down is true, clear all lens and highlighting When the cursor is
      out of the position range of the matched instance or any texts are changed
  ]]
  -- default false
  calm_down = false,

  -- Only add lens for the nearest matched instance and ignore others
  -- default false
  nearest_only = false,

  --[[
    When to open the floating window for the nearest lens.
      'auto': floating window will be opened if room isn't enough for virtual text;
      'always': always use floating window instead of virtual text;
      'never': never use floating window for the nearest lens
  ]]
  --default 'auto'
  nearest_float_when = 'auto',

  -- Winblend of the nearest floating window. `:h winbl` for more details
  -- default 50
  float_shadow_blend = 50,

  --[[
    Priority of virtual text, set it lower to overlay others.
      `:h nvim_buf_set_extmark` for more details
  ]]
  -- default 100
  virt_priority = 100,

  --[[
    Hackable function for customizing the lens. If you like hacking, you
      should search `override_lens` and inspect the corresponding source code.
      There's no guarantee that this function will not be changed in the future. If it is
      changed, it will be listed in the CHANGES file.
      @param render table an inner module for hlslens, use `setVirt` to set virtual text
      @param splist table (1,1)-indexed position
      @param nearest boolean whether nearest lens
      @param idx number nearest index in the plist
      @param relIdx number relative index, negative means before current position,
                                positive means after
  ]]
  -- default nil
  override_lens = nil,
}

Plugin.config = function(_, opts)
  require('hlslens').setup(opts)

  local nvim_set_keymap = vim.api.nvim_set_keymap
  local kopts = { noremap = true, silent = true }
  nvim_set_keymap(
    'n',
    'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts
  )
  nvim_set_keymap(
    'n',
    'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts
  )
  nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
  nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

  --[[
    default: <Leader>l
    change <Leader>l to <Leader>L, because it already seted another keybind.
  ]]
  nvim_set_keymap('n', '<Leader>L', '<Cmd>noh<CR>', kopts)
end

return Plugin
