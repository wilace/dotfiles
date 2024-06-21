local options = require('config/options')
local keymaps = require('config/keymaps')
local lazy = require('config/lazy')

options.load_options()
keymaps.load_keymaps()
lazy.load_lazy()
