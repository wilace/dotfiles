local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'iceberg-light'
config.use_ime = true

config.initial_cols = 90
config.initial_rows = 25

config.font = wezterm.font_with_fallback {
    '0xProto Nerd Font',
    'IBM Plex Sans JP'
}
config.font_size = 24.0

config.window_frame = {
    font = wezterm.font { family = 'Roboto', weight = 'Bold' },
    font_size = 18.0,
}

return config