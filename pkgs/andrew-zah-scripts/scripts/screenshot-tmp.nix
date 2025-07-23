{pkgs, ...}:
pkgs.writeShellScriptBin "screenshot-tmp" ''
  set -e

  # unix timestamp
  # unlikely to ever need higher resolution
  outfile="/tmp/$(date '+%s').png"

  set -u

  sleep 0.01;

  exec "${pkgs.lib.getExe pkgs.scrot}" -s -F "$outfile"
  # grim -g "$(slurp)" "$outfile"
''
