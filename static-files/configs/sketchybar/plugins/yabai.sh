#!/usr/bin/env bash
LAYOUT=$(yabai -m query --spaces --space | jq -r .type)

source "$CONFIG_DIR/icons.sh"

window_state() {
  WINDOW=$(yabai -m query --windows --window)
  STACK_INDEX=$(echo "$WINDOW" | jq '.["stack-index"]')

  COLOR=$BAR_BORDER_COLOR
  ICON=""

  if [ "$(echo "$WINDOW" | jq '.["is-floating"]')" = "true" ]; then
    ICON+=$YABAI_FLOAT
    COLOR=$MAGENTA
  elif [ "$(echo "$WINDOW" | jq '.["has-fullscreen-zoom"]')" = "true" ]; then
    ICON+=$YABAI_FULLSCREEN_ZOOM
    COLOR=$GREEN
  elif [ "$(echo "$WINDOW" | jq '.["has-parent-zoom"]')" = "true" ]; then
    ICON+=$YABAI_PARENT_ZOOM
    COLOR=$BLUE
  elif [[ $STACK_INDEX -gt 0 ]]; then
    LAST_STACK_INDEX=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
    ICON+=$YABAI_STACK
    LABEL="$(printf "[%s/%s]" "$STACK_INDEX" "$LAST_STACK_INDEX")"
    COLOR=$RED
  elif [[ $LAYOUT == "bsp" ]]; then
    ICON+=$YABAI_BSP
  fi

  args=(--animate sin 10 --bar border_color="$COLOR"
    --set "$NAME" icon.color="$COLOR")

  [ -z "$LABEL" ] && args+=(label.width=0) ||
    args+=(label="$LABEL" label.width=40)

  [ -z "$ICON" ] && args+=(icon.width=0) ||
    args+=(icon="$ICON" icon.width=30)

  sketchybar -m "${args[@]}"
}

windows_on_spaces() {
  CURRENT_SPACES="$(yabai -m query --displays | jq -r '.[].spaces | @sh')"

  args=(--set spaces_bracket drawing=off
    --set '/space\..*/' background.drawing=on
    --animate sin 10)

  while read -r line; do
    for space in $line; do
      icon_strip=" "
      apps=$(yabai -m query --windows --space "$space" | jq -r ".[].app")
      if [ "$apps" != "" ]; then
        while IFS= read -r app; do
          icon_strip+=" $("$CONFIG_DIR"/plugins/icon_map.sh "$app")"
        done <<<"$apps"
      fi
      args+=(--set "space.$space" label="$icon_strip" label.drawing=on)
    done
  done <<<"$CURRENT_SPACES"

  sketchybar -m "${args[@]}"
}

mouse_clicked() {
  case "$LAYOUT" in
  bsp)
    yabai -m space --layout stack
    ;;
  stack)
    yabai -m space --layout bsp
    ;;
  float)
    yabai -m space --layout bsp
    ;;
  esac
  window_state
}

case "$SENDER" in
"mouse.clicked")
  mouse_clicked
  ;;
"forced")
  exit 0
  ;;
"window_focus")
  window_state
  ;;
"windows_on_spaces" | "space_change")
  windows_on_spaces
  ;;
esac
