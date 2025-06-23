{pkgs, myNvim, ...}:
pkgs.writeShellScriptBin "v" ''
  ${pkgs.lib.meta.getExe myNvim} $@
''
