local wezterm = require 'wezterm'

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'nord'
  else
    -- return 'nord-light'
    return 'PaperColor Light (base16)'
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
  font = wezterm.font 'JetBrains Mono',
  font_size = 12.0,
  line_height = 1.1,
  scrollback_lines = 5000,
  audible_bell = 'Disabled'
}
