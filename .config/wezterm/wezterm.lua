local wezterm = require('wezterm')
local act = wezterm.action

-- Colors
local color_black01 = '#18181b'
local color_black02 = '#222225'
local color_darkaqua = '#41868b'
local color_purple01 = '#787096'

-- Config
local config = {
    default_prog = { '/usr/bin/fish', '-l' },
    font = wezterm.font('JetBrainsMono Nerd Font Mono'),
    font_size = 10,
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    color_scheme = 'kanagawabones',
    colors = {
        background = color_black01,
        tab_bar = {
            background = color_black01,
            active_tab = {
                bg_color = color_darkaqua,
                fg_color = color_black01,
                intensity = 'Bold',
            },
            inactive_tab = {
                bg_color = color_black01,
                fg_color = color_purple01,
                intensity = 'Normal',
            },
            new_tab = {
                bg_color = color_black02,
                fg_color = color_darkaqua,
            },
        },
    },
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    text_background_opacity = 1.0,
    window_background_opacity = 0.9,
    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
    },
    automatically_reload_config = false,
    -- Keys remap
    keys = {
        { key = '-', mods = 'SUPER',      action = act.DisableDefaultAssignment },
        { key = 'S', mods = 'SHIFT|CTRL', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
        { key = 'H', mods = 'SHIFT|CTRL', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        -- workspaces
        { key = 'y', mods = 'SHIFT|CTRL', action = act.SwitchToWorkspace { name = 'default' } },
        { key = 'o', mods = 'SHIFT|CTRL', action = act.SwitchWorkspaceRelative(-1) },
        { key = 'e', mods = 'SHIFT|CTRL', action = act.SwitchWorkspaceRelative(1) },
        { key = 'a', mods = 'SHIFT|CTRL', action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' } },
    },
}

return config
