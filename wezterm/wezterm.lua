local wezterm = require('wezterm')
local act = wezterm.action

local config = {}

if wezterm.config_builer then
  config = wezterm.config_builer()
end

local function scheme_for_appearance(appearance)
  if appearance:find('Dark') then
    return 'iceberg-dark'
  else
    return 'iceberg-light'
  end
end

wezterm.on('window-config-reloaded', function(window)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

config.font = wezterm.font('Berkeley Mono')
config.font_size = 12.0
config.line_height = 1.125
config.scrollback_lines = 10000
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.keys = {
  {
    key = 'm',
    mods = 'CMD',
    action = 'DisableDefaultAssignment',
  },
  {
    key = 'k',
    mods = 'CMD',
    action = act.Multiple({
      act.SendKey({
        key = 'L',
        mods = 'CTRL',
      })
    })
  }
}

return config
