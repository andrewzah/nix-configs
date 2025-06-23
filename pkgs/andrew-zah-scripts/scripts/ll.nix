{pkgs, ...}:
pkgs.writeShellScriptBin "ll" ''
  ${pkgs.lib.meta.getExe pkgs.lsd} -la --icon never $@
''
