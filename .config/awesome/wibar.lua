local awful = require("awful")
local gears = require("gears")
-- Widget and layout library
local wibox = require("wibox")

-- Awesome widgets - https://github.com/streetturtle/awesome-wm-widgets
local battery_widget = require("widgets.awesome-wm-widgets.battery-widget.battery")

local clock_calendar = require("widgets.clock-calendar")
local taglist_buttons = require("widgets.taglist")
local tasklist_buttons = require("widgets.tasklist")

local function set_wallpaper(_)
    -- Use the last feh wallpaper
    -- - In my shell I use a 'fehrandom' function to randomize it
    awful.spawn(os.getenv("HOME") .. "/.fehbg")
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.spiral,
    awful.layout.suit.magnifier,
    awful.layout.suit.floating,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.max,
    --awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
    awful.tag.find_by_name(s, "4"):view_only() -- start in tag 4

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }
    -- Create a systray
    s.systray = wibox.widget.systray()
    s.systray.visible = true

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen          = s,
        filter          = awful.widget.tasklist.filter.currenttags,
        buttons         = tasklist_buttons,
        style           = {
            bg_focus = "#18181b"
        },
        layout          = {
            spacing = 10,
            spacing_widget = {
                {
                    forced_width = 2,
                    shape = gears.shape.circle,
                    widget = wibox.widget.separator
                },
                halign = "center",
                valign = "center",
                widget = wibox.container.place,
            },
            layout = wibox.layout.flex.horizontal
        },
        widget_template = {
            {
                {
                    {
                        {
                            id = "icon_role",
                            widget = wibox.widget.imagebox,
                        },
                        margins = 2,
                        widget = wibox.container.margin,
                    },
                    --[[{
                        id = "text_role",
                        widget = wibox.widget.textbox,
                    },]]
                    layout = wibox.layout.fixed.horizontal,
                },
                left = 10,
                right = 10,
                widget = wibox.container.margin,
            },
            id = "background_role",
            widget = wibox.container.background,
        },
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        expand = "none",
        layout = wibox.layout.align.horizontal,
        {
            -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        {
            -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --mykeyboardlayout,
            --wibox.widget.systray(),
            s.systray,
            clock_calendar,
            battery_widget(),
            s.mylayoutbox,
        },
    }
end)

-- Wibar visibility {{{
local function checkWibarForTag(t)
    t.screen.mywibox.visible = t.barvisible
end

local function toggleWibarForTag()
    local t = awful.screen.focused().selected_tag
    t.barvisible = not t.barvisible
    checkWibarForTag(t)
end

for i, t in pairs(root.tags()) do
    t.barvisible = true
end

tag.connect_signal("property::selected", checkWibarForTag)
--}}}

return toggleWibarForTag
