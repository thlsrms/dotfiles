local wibox = require("wibox")
local calendar_widget = require("widgets.awesome-wm-widgets.calendar-widget.calendar")

local clock_calendar = wibox.widget.textclock()
local cw = calendar_widget({
    theme = "dark",
    placement = "top_right",
    start_sunday = true,
    previous_month_button = 4,
    next_month_button = 5,
})
clock_calendar:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then cw.toggle() end
    end
)

return clock_calendar
