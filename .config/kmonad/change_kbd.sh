#!/bin/bash
# Start kmonad by selecting the keyboard to be grabbed by it

KBD_DEVICE=$(find /dev/input/by-path/*kbd* | fzf)
export KBD_DEVICE
KBD_CONFIG=$(envsubst < $HOME/.config/kmonad/config.kbd)

if pgrep -x "kmonad" > /dev/null
then
    killall kmonad
fi

kmonad <(echo "$KBD_CONFIG") &

