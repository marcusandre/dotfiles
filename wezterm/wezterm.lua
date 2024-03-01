local wezterm = require('wezterm')

local config = wezterm.config_builder()

-- General
config.term = 'wezterm'

-- Text
config.font = wezterm.font('Berkeley Mono')
config.line_height = 1.125

-- Colors
config.color_scheme = 'carbonfox'
-- config.color_scheme = 'tokyonight_storm'
-- config.color_scheme = 'Gruvbox dark, dark (base16)'
-- config.color_scheme = 'Everforest Dark (Gogh)'

-- UI
config.enable_scroll_bar = false

config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Keymaps
local act = wezterm.action

config.keys = {
  { mods = 'ALT', key = 'Enter', action = 'DisableDefaultAssignment' },
  { mods = 'ALT', key = '\\', action = act.ShowTabNavigator },
  { mods = 'CMD', key = ',', action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
  { mods = 'CMD', key = '.', action = act.SplitVertical({ domain = 'CurrentPaneDomain' }) },
  { mods = 'CMD', key = 'DownArrow', action = act.AdjustPaneSize({ 'Down', 5 }) },
  { mods = 'CMD', key = 'LeftArrow', action = act.AdjustPaneSize({ 'Left', 5 }) },
  { mods = 'CMD', key = 'RightArrow', action = act.AdjustPaneSize({ 'Right', 5 }) },
  { mods = 'CMD', key = 'UpArrow', action = act.AdjustPaneSize({ 'Up', 5 }) },
  { mods = 'CMD', key = '\\', action = wezterm.action.ToggleFullScreen },
  { mods = 'CMD', key = 'h', action = act.ActivatePaneDirection('Left') },
  { mods = 'CMD', key = 'j', action = act.ActivatePaneDirection('Down') },
  { mods = 'CMD', key = 'k', action = act.ActivatePaneDirection('Up') },
  { mods = 'CMD', key = 'l', action = act.ActivatePaneDirection('Right') },
  { mods = 'CMD', key = 'm', action = 'DisableDefaultAssignment' },
}

return config
