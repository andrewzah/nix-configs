{pkgs, ...}:
pkgs.writeShellScriptBin "pickhex" ''
  ${pkgs.lib.meta.getExe pkgs.xcolor} \
    --format hex \
    --selection clipboard
''
