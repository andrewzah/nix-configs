{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    mkIf
    mkOption
    mkEnableOption
    types
    ;

  cfg = config.zah-hm.editors.rider;
in {
  options.zah-hm.editors.rider = with types; {
  };
}
