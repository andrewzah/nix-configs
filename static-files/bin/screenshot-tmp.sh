#!/usr/bin/env bash

set -e

# unix timestamp
# unlikely to ever need higher resolution
outfile="/tmp/$(date '+%s').png"

sleep 0.01;

if command -v scrot > /dev/null 2>&1; then
  scrot -s -F "$outfile"
elif command -v grim > /dev/null 2>&1; then
  grim -g "$(slurp)" "$outfile"
fi
