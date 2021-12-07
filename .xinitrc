#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
[ -f ~/.xprofile ] && . ~/.xprofile

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset s off
xset -dpms
xset s noblank
