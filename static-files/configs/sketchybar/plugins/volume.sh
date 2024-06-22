#!/usr/bin/env bash

source "$CONFIG_DIR/icons.sh"

VOL_RAW=$(wpctl get-volume 47)
if [ grep -q "MUTED" <<< "$VOL_RAW" ]; then
  VOL="MUTED"
else
  VOL=$(echo "$VOL_RAW" | cut -d' ' -f2 )
  VOL="${VOL%.*}"
fi

DRAWING=on
COLOR=$WHITE
case ${PERCENTAGE} in
9[0-9] | 100)
  ICON=$BATTERY_100
  DRAWING=off
  ;;
[6-8][0-9])
  ICON=$BATTERY_75
  DRAWING=off
  ;;
[3-5][0-9])
  ICON=$BATTERY_50
  ;;
[1-2][0-9])
  ICON=$BATTERY_25
  COLOR=$ORANGE
  ;;
*)
  ICON=$BATTERY_0
  COLOR=$RED
  ;;
esac

if [[ $CHARGING != "" ]]; then
  ICON=$BATTERY_CHARGING
  DRAWING=off
fi

sketchybar --set "$NAME" drawing=$DRAWING icon="$ICON" icon.color="$COLOR"
