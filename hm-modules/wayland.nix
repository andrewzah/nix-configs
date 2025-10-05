{
  pkgs,
  lib,
  config,
  username,
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
      default = with pkgs; [
        grim
        slurp

        fuzzel
        libinput-gestures
        waypaper
        wev
        wl-clipboard
      ];
    };

    sessionVariables = mkOption {
      description = "sessionVars for wayland";
      type = attrs;
      default = {
        #NIXOS_OZONE_WL = 1;
        #ELECTRON_OZONE_PLATFORM_HINT = "auto";
        WLR_NO_HARDWARE_CURSORS = "1";
        XCURSOR_SIZE = "108";
        XKB_DEFAULT_LAYOUT = "us";

        MOZ_ENABLE_WAYLAND = "1";
        MOZ_WEBRENDER = "1";
        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "sway";
        XDG_CONFIG_HOME = "/home/${username}/.config";

        # https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
        GLFW_IM_MODULE = "ibus";
        #GTK_IM_MODULE = "fcitx";
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
