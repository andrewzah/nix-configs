{
  inputs,
  system,
}: let
  buildersOverlay = f: p: {
    mkHomeConfigurations = {
      pkgs ? f,
      extraPkgs ? [],
    }:
      import ./lib/hm.nix {inherit extraPkgs inputs pkgs system;};
  };
in [
  buildersOverlay
]
