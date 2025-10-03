{
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
    config = mkOption {
      type = str;
      default = builtins.readFile ../static-files/configs/dunstrc;
    };
  };

  config = mkIf cfg.enable {
    xdg.configFile."dunst/dunstrc".text = cfg.config;
  };
}
