{pkgs, ...}:
pkgs.writeShellScriptBin "j" ''
  ${pkgs.lib.meta.getExe pkgs.just} $@
''
