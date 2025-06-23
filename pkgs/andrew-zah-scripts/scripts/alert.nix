{pkgs, ...}: let
  getExe = pkgs.lib.meta.getExe;
in
  pkgs.writeShellScriptBin "alert" ''
    set -eo pipefail

    start_time=$(date +%s)

    output=$("$@")
    result_code=$?

    cmd="$1"
    duration=$(($(date +%s) - start_time))

    tput bel
    ${getExe pkgs.libnotify} \
        "($result_code) $cmd - ''\${duration}s" \
        "$output"
  ''
