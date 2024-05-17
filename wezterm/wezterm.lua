local wezterm = require('wezterm')

local config = wezterm.config_builder()

-- General
config.term = 'wezterm'

-- Text
-- config.font = wezterm.font('JetBrains Mono')
-- config.font = wezterm.font('Berkeley Mono')
config.font = wezterm.font('Fira Code')
-- config.font = wezterm.font('Input Mono Narrow')
config.font_size = 14
-- config.line_height = 1.125

config.term = 'wezterm'
config.set_environment_variables = {
  TERMINFO_DIRS = wezterm.home_dir .. '/.terminfo',
}

-- Colors
config.color_scheme = 'nightfox'
-- config.color_scheme = 'tokyonight_storm'
-- config.color_scheme = 'Poimandres'
-- config.color_scheme = 'Molokai (Gogh)'

-- UI
config.enable_scroll_bar = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
-- config.force_reverse_video_cursor = true

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Keymaps
local action = wezterm.action

config.keys = {
  { mods = 'ALT', key = 'Enter', action = 'DisableDefaultAssignment' },
  { mods = 'ALT', key = '\\', action = action.ShowTabNavigator },
  { mods = 'CMD', key = ',', action = action.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
  { mods = 'CMD', key = '.', action = action.SplitVertical({ domain = 'CurrentPaneDomain' }) },
  { mods = 'CMD', key = 'DownArrow', action = action.AdjustPaneSize({ 'Down', 5 }) },
  { mods = 'CMD', key = 'LeftArrow', action = action.AdjustPaneSize({ 'Left', 5 }) },
  { mods = 'CMD', key = 'RightArrow', action = action.AdjustPaneSize({ 'Right', 5 }) },
  { mods = 'CMD', key = 'UpArrow', action = action.AdjustPaneSize({ 'Up', 5 }) },
  { mods = 'CMD', key = '\\', action = wezterm.action.ToggleFullScreen },
  { mods = 'CMD', key = 'e', action = 'ActivateCopyMode' },
  { mods = 'CMD', key = 'h', action = action.ActivatePaneDirection('Left') },
  { mods = 'CMD', key = 'j', action = action.ActivatePaneDirection('Down') },
  { mods = 'CMD', key = 'k', action = action.ActivatePaneDirection('Up') },
  { mods = 'CMD', key = 'l', action = action.ActivatePaneDirection('Right') },
  { mods = 'CMD', key = 'm', action = 'DisableDefaultAssignment' },
  { mods = 'CMD', key = 'w', action = action.CloseCurrentPane({ confirm = true }) },
}

return config
