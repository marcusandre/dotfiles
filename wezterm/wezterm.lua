local wezterm = require('wezterm')
local act = wezterm.action

local config = {}

if wezterm.config_builder then config = wezterm.config_builder() end

config.font = wezterm.font('JetBrains Mono')
config.font_size = 12.0
-- config.color_scheme = 'tokyonight_night'
-- config.color_scheme = 'Gruvbox dark, dark (base16)'
-- config.color_scheme = 'Everforest Dark (Gogh)'
config.color_scheme = 'nightfox'

config.adjust_window_size_when_changing_font_size = false
config.enable_scroll_bar = false
config.freetype_load_flags = 'NO_HINTING'
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.term = 'wezterm'
config.underline_position = -5
config.use_fancy_tab_bar = false
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

wezterm.on('window-config-reloaded', function(window)
  if wezterm.gui.screens().active.name == 'HP E233' then
    window:set_config_overrides({
      dpi = 100.13,
      font_size = 8.8,
    })
  end
end)

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
