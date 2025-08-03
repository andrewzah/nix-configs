{pkgs, ...}:
pkgs.writeShellScriptBin "cgz" ''
  cd ~/programming/game/src/ZGame "$@"
''
