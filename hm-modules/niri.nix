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
  waylandCfg = config.zah-hm.graphics.wayland;
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
      type = listOf packages;
      default = [
        pkgs.xwayland-satellite
      ];
    };
  };

  config = mkIf (cfg.enable
    && waylandCfg.enable) {
    xdg.configFile."niri/config.kdl".text = cfg.config;
  };
}
