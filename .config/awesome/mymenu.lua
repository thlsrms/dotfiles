local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
local wibox = require("wibox")

-- TODO: Add icons for the entries

-- This is used later as the default terminal and editor to run.
terminal = "wezterm"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

local applications = {
    { "Brave browser", function() awful.spawn("brave") end },
    { "Discord",       function() awful.spawn("discord") end },
    { "Dolphin",       function() awful.spawn("dolphin") end }
}

-- Create a launcher widget and a main menu
myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    --{ "manual",      terminal .. " -e man awesome" },
    --{ "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit",    function() awesome.quit() end },
}

mymainmenu = awful.menu({
    items = {
        { "applications",  applications },
        { "open terminal", terminal },
        { "awesome",       myawesomemenu, }, --beautiful.awesome_icon },
        { "sesion",        function() awful.spawn("archlinux-logout") end },
    }
})

--[[mylauncher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = mymainmenu
})]]
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
