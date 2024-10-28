local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Gruvbox dark, hard (base16)'
config.font = wezterm.font 'Iosevka'
config.font_size = 18
-- config.disable_default_key_bindings = true

config.keys = {
  {
    key = '|',
    mods = 'ALT|SHIFT',
    action = wezterm.action.SplitHorizontal,
  },
  {
    key = '-',
    mods = 'ALT',
    action = wezterm.action.SplitVertical,
  },
  {
    key = '{',
    mods = 'SHIFT|ALT',
    action = wezterm.action.MoveTabRelative(-1),
  },
  {
    key = '}',
    mods = 'SHIFT|ALT',
    action = wezterm.action.MoveTabRelative(1),
  },
  {
    key = '[',
    mods = 'ALT',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = ']',
    mods = 'ALT',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'j',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection('Down'),
  },
  {
    key = 'k',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection('Up'),
  },
  {
    key = 'h',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection('Left'),
  },
  {
    key = 'l',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection('Right'),
  },
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane {confirm = true},
  },
  {
    key = 'j',
    mods = 'SHIFT|ALT',
    action = wezterm.action.AdjustPaneSize {'Down', 5},
  },
  {
    key = 'k',
    mods = 'SHIFT|ALT',
    action = wezterm.action.AdjustPaneSize {'Up', 5},
  },
  {
    key = 'h',
    mods = 'SHIFT|ALT',
    action = wezterm.action.AdjustPaneSize {'Left', 5},
  },
  {
    key = 'l',
    mods = 'SHIFT|ALT',
    action = wezterm.action.AdjustPaneSize {'Right', 5},
  },
}

config.default_cursor_style = "BlinkingBar"
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

return config
