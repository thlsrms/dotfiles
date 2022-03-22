#!/bin/sh

status() {
  MUTED=$(pacmd list-sources | awk '/\*/,EOF {print}' | awk '/muted/ {print $2; exit}')

  if [ "$MUTED" = "yes" ]; then
    echo "%{u#ab2115}%{+u}%{F#f00}  mtd "
  else
    VOLUME=$(pacmd list-sources | grep "\* index:" -A 7 | grep volume | awk -F/ '{print $2}' | tr -d ' ' ) 
    echo "%{u#3384d0}%{+u}   $VOLUME "
  fi
}

listen() {
    status

    LANG=EN; pactl subscribe | while read -r event; do
        if echo "$event" | grep -q "source" || echo "$event" | grep -q "server"; then
            # Making sure the correct input device is the default
            pacmd set-default-source 1
            status
        fi
    done
}

toggle() {
  MUTED=$(pacmd list-sources | awk '/\*/,EOF {print}' | awk '/muted/ {print $2; exit}')
  DEFAULT_SOURCE=$(pacmd list-sources | awk '/\*/,EOF {print $3; exit}')

  if [ "$MUTED" = "yes" ]; then
      pactl set-source-mute "$DEFAULT_SOURCE" 0
  else
      pactl set-source-mute "$DEFAULT_SOURCE" 1
  fi
}

increase() {
  DEFAULT_SOURCE=$(pacmd list-sources | awk '/\*/,EOF {print $3; exit}')
  pactl set-source-volume "$DEFAULT_SOURCE" +5%
}

decrease() {
  DEFAULT_SOURCE=$(pacmd list-sources | awk '/\*/,EOF {print $3; exit}')
  pactl set-source-volume "$DEFAULT_SOURCE" -5%
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
