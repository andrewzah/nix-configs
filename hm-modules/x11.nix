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

  cfg = config.zah-hm.graphics.x11;
in {
  options.zah-hm.graphics.x11 = with types; {
    enable = mkEnableOption "Enable X11 and related programs.";

    packages = mkOption {
      description = "set of packages associated with x11 usage";
      type = listOf package;
      default = with pkgs; [
        discord
        discordchatexporter-cli
        dunst
        rofi

        adwaita-qt
        dconf
        xdg-desktop-portal-gtk

        glib
        xclip
        xorg.xev
        xwallpaper
      ];
    };

    sessionVariables = mkOption {
      description = "attrs of session variables to add";
      type = attrs;
      default = {
        XDG_DATA_HOME = "/home/${username}/.local/share";
        XKB_DEFAULT_LAYOUT = "us";
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
  };
}
