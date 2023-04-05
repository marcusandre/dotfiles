local wezterm = require 'wezterm'
local act = wezterm.action

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'nordfox'
  else
    return 'dayfox'
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

return {
  font = wezterm.font 'Berkeley Mono',
  font_size = 12.0,
  line_height = 1.125,
  scrollback_lines = 10000,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  keys = {
    {
      key = 'm',
      mods = 'CMD',
      action = 'DisableDefaultAssignment'
    },
    {
      key = 'k',
      mods = 'CMD',
      action = act.Multiple {
        act.SendKey {
          key = 'L',
          mods = 'CTRL'
        }
      }
    },
  }
}
