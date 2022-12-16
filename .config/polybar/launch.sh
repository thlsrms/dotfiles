#!/usr/bin/env sh

# More info : https://github.com/jaagr/polybar/wiki

# Install the following applications for polybar and icons in polybar
# awesome-terminal-fonts
# Tip : There are other interesting fonts that provide icons like nerd-fonts-complete
# --log=error
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

desktop=$(echo $XDG_SESSION_DESKTOP)
count=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mainbar-i3 -c ~/.config/polybar/config &
  done
else
polybar --reload mainbar-i3 -c ~/.config/polybar/config &
fi
# second polybar at bottom
# if type "xrandr" > /dev/null; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload mainbar-i3-extra -c ~/.config/polybar/config &
#   done
# else
# polybar --reload mainbar-i3-extra -c ~/.config/polybar/config &
# fi
