#!/usr/bin/env bash

# unix timestamp
# unlikely to ever need higher resolution
outfile="/tmp/$(date '+%s').png"

sleep 0.01;
# TODO: either make this script Wayland/X11 agnostic
# OR make separate scripts.
grim "$outfile" -t png
