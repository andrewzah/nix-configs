#!/usr/bin/env bash

volume=(
  script="$PLUGIN_DIR/volume.sh"
  icon.font="$FONT:Regular:19.0"
  padding_right=5
  padding_left=0
  label.drawing=off
  update_freq=120
  updates=on
)

sketchybar --add item volume right \
  --set volume "${volume[@]}" \
  --subscribe volume system_woke
