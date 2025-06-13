local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- fontsettings
config.font_size = 12
config.font = wezterm.font("Noto Sans Mono")

-- Colores

config.colors = {
    -- cursor_bg = "white",
    -- cursor_border = "white",

}

config.color_scheme = "rose-pine"

-- Ventanas

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 0.9
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

return config
