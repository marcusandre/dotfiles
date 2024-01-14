local wezterm = require('wezterm')
local act = wezterm.action

local config = {}

if wezterm.config_builder then config = wezterm.config_builder() end

config.font = wezterm.font('Berkeley Mono')
config.font_size = 12.0
config.line_height = 1.15
config.underline_position = -5

config.color_scheme = 'tokyonight_moon'
-- config.color_scheme = 'Catppuccin Macchiato'

config.freetype_load_target = 'HorizontalLcd'

config.enable_scroll_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.adjust_window_size_when_changing_font_size = false

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- config.inactive_pane_hsb = {
--   saturation = 0.6,
--   brightness = 0.6,
-- }

wezterm.on('window-config-reloaded', function(window)
  if wezterm.gui.screens().active.name ~= 'LG HDR WQHD' then
    window:set_config_overrides({
      front_end = 'WebGpu',
    })
  end
end)

config.keys = {
  { mods = 'ALT', key = 'Enter', action = 'DisableDefaultAssignment' },
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
