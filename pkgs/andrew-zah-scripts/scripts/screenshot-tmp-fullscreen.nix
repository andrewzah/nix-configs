{pkgs, ...}:
pkgs.writeShellScriptBin "screenshot-tmp-fullscreen" ''
  set -e

  # unix timestamp
  # unlikely to ever need higher resolution
  outfile="/tmp/$(date '+%s').png"

  set -u

  sleep 0.01;

  exec "${pkgs.lib.getExe pkgs.scrot}" -F "$outfile"

  # wayland:
  #grim -g "$(slurp)" "$outfile"
  #grim "$outfile" -t png
''
