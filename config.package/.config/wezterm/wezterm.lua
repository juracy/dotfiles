local wezterm = require 'wezterm';
return {
  --font = wezterm.font("Iosevka", { weight = "ExtraLight", stretch = "Normal", style = "Normal" }),
  --font = wezterm.font("Iosevka", { weight = "Medium", stretch = "Normal", style = "Normal" }),
  --font = wezterm.font("Iosevka", { weight = "Regular", stretch = "Normal", style = "Normal" }),
  font = wezterm.font_with_fallback({
    --{ family = "JetBrains Mono" },
    { family = "Iosevka", weight = "Light", stretch = "Normal", style = "Normal" },
    { family = "PowerlineSymbols" },
    { family = "Symbols Nerd Font Mono" },
    { family = "FontAwesome" },
  }),
  --font = wezterm.font("Iosevka", { weight = "Expanded", stretch = "Normal", style = "Normal" }),
  --font = wezterm.font("Noto Mono", { weight = "Regular", stretch = "Normal", style = "Normal" }),
  --font = wezterm.font("Ubuntu Mono", { weight = "Regular", stretch = "Normal", style = "Normal" }),
  font_size = 18.0,
  --color_scheme = "Banana Blueberry",
  --color_scheme = "Calamity",
  --color_scheme = "Darkside", -- auto-complete
  color_scheme = "DimmedMonokai", -- best
  --color_scheme = "Dracula", -- bom
  --color_scheme = "Duotone Dark", -- médio
  --color_scheme = "deep", -- bom, mas bem escuro
  enable_wayland = false,
  enable_kitty_keyboard = true,
  exit_behavior = "Close",
  adjust_window_size_when_changing_font_size = false,
  line_height = 1.2,
  keys = {
    { key = "l", mods = "ALT", action = "ShowLauncher" },
  },
  launch_menu = {
    {
      args = { "htop" },
    }
  }
}
