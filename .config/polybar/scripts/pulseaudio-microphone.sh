#!/bin/sh

status () {
    MUTED=$(wpctl get-volume @DEFAULT_SOURCE@ | grep 'MUTED')

    if test -z "$MUTED"
    then
        VOLUME=$(wpctl get-volume @DEFAULT_SOURCE@ | tr -d 'Volume: ' | awk '{print $1 * 100}') 
        if  [[ $VOLUME -gt 60 ]]; then
            # Limit mic volume to 0.40 to fight the mic boost, until a better solution is found
            wpctl set-volume @DEFAULT_SOURCE@ 0.40
        fi

        echo "%{u#3384d0}%{+u}   $VOLUME "
    else
        echo "%{u#ab2115}%{+u}%{F#f00}  mtd "
    fi
}

listen() {
    status
    LANG=EN; pactl subscribe | while read -r event; do
        if echo "$event" | grep -q "source" || echo "$event" | grep -q "server"; then
            status
        fi
    done
}

toggle() {
    wpctl set-mute @DEFAULT_SOURCE@ toggle
}

increase() {
    wpctl set-volume @DEFAULT_SOURCE@ 0.02+
}

decrease() {
    wpctl set-volume @DEFAULT_SOURCE@ 0.02-
}

case "$1" in
    --toggle)
        toggle
    ;;
    --increase)
        increase
    ;;
    --decrease)
        decrease
    ;;
    *)
        listen
    ;;
esac
