{pkgs, ...}:
pkgs.writeShellScriptBin "cst" ''
  cd ~/sync/thoughts "$@"
''
