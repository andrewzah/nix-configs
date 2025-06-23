{
  pkgs,
  stdenv,
  myNvim,
  ...
}: let
  l = pkgs.lib // builtins;

  scriptFiles = l.readDir ./scripts;
  excludeFiles = ["v.nix"];

  nixFiles =
    l.filter (name: l.match ".*\\.nix$" name != null && !(builtins.elem name excludeFiles))
    (l.attrNames scriptFiles);

  scriptPackages =
    map (
      fileName:
        pkgs.callPackage (./scripts + "/${fileName}") {}
    )
    nixFiles;
in
  scriptPackages
  ++ [
    (pkgs.callPackage ./scripts/v.nix {inherit myNvim;})
  ]
