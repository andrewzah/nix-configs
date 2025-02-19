{ pkgs, lib, config, ... }: let
  inherit (lib) mkIf;
in {
  config = mkIf config.x11.enable {
  };
}
