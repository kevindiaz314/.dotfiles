-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 15

config.window_decorations = "RESIZE"

-- Disable tab bar
config.enable_tab_bar = false

-- Color scheme
config.color_scheme = 'Tokyo Night'

-- Opacity
-- config.window_background_opacity = 0.2
-- config.macos_window_background_blur = 0

return config
