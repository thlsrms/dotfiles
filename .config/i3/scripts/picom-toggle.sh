#!/bin/bash
if pgrep -x "picom" > /dev/null
then
	killall picom
else
  # picom --backend glx
	picom -cCFb
fi
