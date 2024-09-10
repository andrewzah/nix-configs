#!/usr/bin/env bash

set -e

SINK="@DEFAULT_AUDIO_SINK@"
VOL_RAW=$(wpctl get-volume "$SINK")
if [ $(grep -c "MUTED" <<< "$VOL_RAW") -eq 1 ]; then
  TEXT="VOL MUTE"
else
  VOL=$(echo "$VOL_RAW" | cut -d' ' -f2 )
  VOL=$(echo "$VOL * 100" | bc -l)
  TEXT="VOL ${VOL%.*}%"
fi
TEXT="  $TEXT  "

printf '{"text": "%s", "class": "%s"}\n' "$TEXT" "$CLASS"
