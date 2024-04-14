#!/usr/bin/env bash

wifi="$(networksetup -getairportnetwork en0)"
ssid="$(echo "$wifi" | grep -o "Network: .*" | sed 's#^Network: ##')"

if [ "$ssid" != "" ]; then
  sketchybar --set $NAME label="$ssid"
fi
