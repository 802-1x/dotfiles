local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

wezterm.on('gui-startup', function()
  local tab, pane, window = mux.spawn_window({})
  window:gui_window():maximize()
end)

-- Settings
local config = {
  default_prog = { '/usr/bin/fish', '-l' },
  window_decorations = "RESIZE",

  inactive_pane_hsb = {
    saturation = 0.8,ex,
    brightness = 0.7,
  },

  color_scheme = 'Tokyo Night',
  font = wezterm.font('JetBrainsMono Nerd Font'),
  font_size = 14,
  line_height = 1.1,

  use_dead_keys = false,
  scrollback_lines = 3000,

  adjust_window_size_when_changing_font_size = false,
  hide_tab_bar_if_only_one_tab = true,

  window_frame = {
    font = wezterm.font { family = 'Noto Sans', weight = 'Regular' },
  },

  disable_default_key_bindings = true,

  keys = {
    { key = 'l', mods = 'CTRL', action = act.ActivateTabRelative(1) },
    { key = 'h', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
    { key = 'j', mods = 'CTRL', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'CTRL', action = act.ActivatePaneDirection 'Up' },
    { key = 'Enter', mods = 'CTRL', action = act.ActivateCopyMode },
    { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
    { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
    { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
    { key = '0', mods = 'CTRL', action = act.ResetFontSize },
    { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
    { key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
    { key = 'U', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
    { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
    { key = 'PageDown', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
    { key = 'PageUp', mods = 'CTRL', action = act.ActivateTabRelative(1) },
    { key = 'LeftArrow', mods = 'CTRL', action = act.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = 'CTRL', action = act.ActivatePaneDirection 'Right' },
    { key = 'UpArrow', mods = 'CTRL', action = act.ActivatePaneDirection 'Up' },
    { key = 'DownArrow', mods = 'CTRL', action = act.ActivatePaneDirection 'Down' },
    { key = 'f', mods = 'CTRL', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'd', mods = 'CTRL', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'h', mods = 'CTRL', action = act.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'CTRL', action = act.ActivatePaneDirection 'Right' },
    { key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'w', mods = 'CTRL', action = act.CloseCurrentTab{ confirm = false } },
    { key = 'x', mods = 'CTRL', action = act.CloseCurrentPane{ confirm = false } },
    { key = 'b', mods = 'LEADER|CTRL', action = act.SendString '\x02' },
    { key = 'Enter', mods = 'LEADER', action = act.ActivateCopyMode },
    { key = 'p', mods = 'LEADER', action = act.PasteFrom 'Clipboard' },
    {
      key = 'k',
      mods = 'CTRL|ALT',
      action = act.Multiple {
        act.ClearScrollback 'ScrollbackAndViewport',
        act.SendKey { key = 'L', mods = 'CTRL' },
      },
    },
    { key = 'r', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false } },
  },
}

return config
