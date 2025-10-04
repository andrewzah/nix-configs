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

  cfg = config.zah-hm.graphics.niri;
in {
  options.zah-hm.graphics.niri = with types; {
    enable = mkEnableOption "enable niri";

    config = mkOption {
      description = "config for niri";
      type = str;
      default = builtins.readFile ../static-files/configs/niri.kdl;
    };

    sessionVariables = mkOption {
      description = "attrs of session variables to add";
      type = attrs;
      default = {
        DISPLAY = ":0";
      };
    };

    packages = mkOption {
      description = "extra packages for Niri to work nicely";
      type = listOf package;
      default = [
        pkgs.xwayland-satellite
      ];
    };
  };

  config = mkIf cfg.enable {
    home.packages = cfg.packages;
    home.sessionVariables = cfg.sessionVariables;
    xdg.configFile."niri/config.kdl".text = cfg.config;
  };
}
