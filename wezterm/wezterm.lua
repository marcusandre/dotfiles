local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return "Catppuccin Macchiato"
  else
    -- return "dayfox"
    return "Catppuccin Macchiato"
  end
end

wezterm.on("window-config-reloaded", function(window)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

config.font = wezterm.font("Berkeley Mono")
config.font_size = 12
config.line_height = 1.15
config.adjust_window_size_when_changing_font_size = false

config.initial_cols = 200
config.initial_rows = 55
config.scrollback_lines = 10000
config.enable_scroll_bar = false

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false

-- config.window_close_confirmation = "NeverPrompt"
-- config.window_background_opacity = 0.9

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.keys = {
  {
    key = "m",
    mods = "CMD",
    action = "DisableDefaultAssignment",
  },
  {
    key = "k",
    mods = "CMD",
    action = act.Multiple({
      act.SendKey({
        key = "L",
        mods = "CTRL",
      }),
    }),
  },
  {
    key = "\\",
    mods = "CMD",
    action = wezterm.action.ToggleFullScreen,
  },
}

return config
