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

  cfg = config.zah-hm.graphics.wayland;
in {
  options.zah-hm.graphics.wayland = with types; {
    enable = mkEnableOption "enable niri";

    config = mkOption {
      description = "config for niri";
      type = str;
      default = builtins.readFile ../static-files/configs/niri.kdl;
    };

    packages = mkOption {
      description = "extra packages for wayland";
      type = listOf package;
      default = [
        pkgs.grim
        pkgs.slurp
        pkgs.wev
        pkgs.wl-clipboard
        pkgs.fuzzel
      ];
    };

    sessionVariables = mkOption {
      description = "sessionVars for wayland";
      type = attrs;
      default = {
        NIXOS_OZONE_WL = 1;
        WLR_NO_HARDWARE_CURSORS = "1";
        XCURSOR_SIZE = "108";
        XKB_DEFAULT_LAYOUT = "us";

        MOZ_ENABLE_WAYLAND = "1";
        MOZ_WEBRENDER = "1";
        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "sway";

        GLFW_IM_MODULE = "ibus";
        GTK_IM_MODULE = "fcitx";
        IMSETTINGS_MODULE = "fcitx";
        INPUT_METHOD = "fcitx";
        QT_IM_MODULE = "fcitx";
        SDL_IM_MODULE = "fcitx";
        XMODIFIERS = "@im,fcitx";
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = cfg.packages;
    home.sessionVariables = cfg.sessionVariables;
    xdg.configFile."libinput-gestures.conf".text = builtins.readFile ../static-files/configs/libinput-gestures.conf;
  };
}
