{pkgs, ...}:
pkgs.writeShellScriptBin "zkillall" ''
  set -eu

  to_kill=''${1:-Please specify the process name to kill.}

  ps aux \
    | rg -i "$to_kill" \
    | awk '{print $2}' \
    | xargs kill -9
''
