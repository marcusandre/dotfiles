local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- General
config.term = "wezterm"

-- Text
config.font = wezterm.font_with_fallback({
  "Essential PragmataPro",
  "Input Mono Condensed",
  "JetBrains Mono",
  "Berkeley Mono",
})

config.font_size = 14
config.line_height = 1.125

config.initial_rows = 50
config.initial_cols = 200

config.term = "wezterm"
config.set_environment_variables = {
  TERMINFO_DIRS = wezterm.home_dir .. "/.terminfo",
}

-- Colors
local scheme_for_appearance = function(appearance)
  if appearance:find("Dark") then
    return "tokyonight"
  else
    return "tokyonight"
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

-- UI
config.enable_scroll_bar = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Keymaps
local action = wezterm.action

local close_other_panes = function(win, pane)
  local tab = win:active_tab()
  for _, p in ipairs(tab:panes()) do
    if p:pane_id() ~= pane:pane_id() then
      p:activate()
      win:perform_action(action.CloseCurrentPane({ confirm = false }), p)
    end
  end
end

config.keys = {
  { mods = "ALT", key = "Enter", action = "DisableDefaultAssignment" },
  { mods = "ALT", key = "\\", action = action.ShowTabNavigator },
  { mods = "CMD", key = ",", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { mods = "CMD", key = ".", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { mods = "CMD", key = "DownArrow", action = action.AdjustPaneSize({ "Down", 5 }) },
  { mods = "CMD", key = "LeftArrow", action = action.AdjustPaneSize({ "Left", 5 }) },
  { mods = "CMD", key = "RightArrow", action = action.AdjustPaneSize({ "Right", 5 }) },
  { mods = "CMD", key = "UpArrow", action = action.AdjustPaneSize({ "Up", 5 }) },
  { mods = "CMD", key = "\\", action = wezterm.action.ToggleFullScreen },
  { mods = "CMD", key = "e", action = "ActivateCopyMode" },
  { mods = "CMD", key = "h", action = action.ActivatePaneDirection("Left") },
  { mods = "CMD", key = "j", action = action.ActivatePaneDirection("Down") },
  { mods = "CMD", key = "k", action = action.ActivatePaneDirection("Up") },
  { mods = "CMD", key = "l", action = action.ActivatePaneDirection("Right") },
  { mods = "CMD", key = "m", action = "DisableDefaultAssignment" },
  { mods = "CMD", key = "w", action = action.CloseCurrentPane({ confirm = true }) },
  { mods = "CMD", key = "W", action = wezterm.action_callback(close_other_panes) },
}

return config
