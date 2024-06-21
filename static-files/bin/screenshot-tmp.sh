#!/usr/bin/env bash

# unix timestamp
# unlikely to ever need higher resolution
outfile="/tmp/$(date '+%s').png"

# TODO: either make this script Wayland/X11 agnostic
# OR make separate scripts.
grim -g "$(slurp)" "$outfile"
