local wezterm = require("wezterm")
local act = wezterm.action

-- Colors
local color_black01 = "#18181b"
local color_black02 = "#222225"
local color_darkaqua = "#41868b"
local color_purple01 = "#787096"

-- Config
local config = {
	default_prog = { "/usr/bin/fish", "-l" },
	font = wezterm.font_with_fallback({
		{
			family = "MonaspaceNeon Nerd Font",
			harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02" },
		},
		"Noto Sans Mono CJK JP",
		"JetBrainsMono Nerd Font Mono",
	}),
	font_size = 11,
	adjust_window_size_when_changing_font_size = false,
	use_cap_height_to_scale_fallback_fonts = true,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	color_scheme = "kanagawabones",
	colors = {
		background = "#202020",
		tab_bar = {
			background = color_black01,
			active_tab = {
				bg_color = color_darkaqua,
				fg_color = color_black01,
				intensity = "Bold",
			},
			inactive_tab = {
				bg_color = color_black01,
				fg_color = color_purple01,
				intensity = "Normal",
			},
			new_tab = {
				bg_color = color_black02,
				fg_color = color_darkaqua,
			},
		},
	},
	window_background_opacity = 0.975,
	text_background_opacity = 1.0,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.8,
	},
	automatically_reload_config = false,
	-- Keys remap
	keys = {
		{ key = "-", mods = "SUPER", action = act.DisableDefaultAssignment },
		{ key = "Tab", mods = "CTRL", action = act.DisableDefaultAssignment },
		{ key = "S", mods = "SHIFT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "H", mods = "SHIFT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		-- workspaces
		{ key = "y", mods = "SHIFT|CTRL", action = act.SwitchToWorkspace({ name = "default" }) },
		{ key = "o", mods = "SHIFT|CTRL", action = act.SwitchWorkspaceRelative(-1) },
		{ key = "e", mods = "SHIFT|CTRL", action = act.SwitchWorkspaceRelative(1) },
		{ key = "a", mods = "SHIFT|CTRL", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	},
}

return config
