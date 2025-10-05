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

  cfg = config.zah-hm.programs.dunst;
in {
  options.zah-hm.programs.dunst = with types; {
    enable = mkEnableOption "enable dunst.";
    package = mkOption {
      description = "dunst package";
      type = package;
      default = pkgs.dunst;
    };
    config = mkOption {
      type = str;
      default = builtins.readFile ../static-files/configs/dunstrc;
    };
  };

  config = mkIf cfg.enable {
    home.packages = [cfg.package];
    xdg.configFile."dunst/dunstrc".text = cfg.config;
  };
}
