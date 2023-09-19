local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")


-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.icon_theme = nil
