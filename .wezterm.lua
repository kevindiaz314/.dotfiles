-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

config.font_size = 15

config.window_decorations = "RESIZE"

-- Color scheme
config.color_scheme = "Tokyo Night"

return config
