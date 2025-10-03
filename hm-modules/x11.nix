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

    i3StatusRustConfig = mkOption {
      description = "attrs for programs.i3status-rust";
      type = attrs;
      default = {
        enable = true;
        bars.top = {
          icons = "none";
          theme = "gruvbox-dark";
          blocks = [
            {
              block = "disk_space";
              path = "/";
              interval = 60;
            }
            {
              block = "memory";
            }
            {
              block = "net";
              device = "^wlp194s0$";
              format = "$speed_down $graph_down";
              format_alt = "$ip $speed_down $graph_down";
              interval = 5;
            }
            {
              block = "temperature";
              format = "$max max";
              interval = 10;
              chip = "*-isa-*";
            }
            {
              block = "sound";
              driver = "pulseaudio";
              click = [
                {
                  button = "left";
                  cmd = "pavucontrol";
                }
              ];
            }
            {
              block = "battery";
              driver = "upower";
              device = "DisplayDevice";
            }
            {
              block = "time";
              interval = 60;
            }
          ];
        };
      };
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
    xsession.windowManager.i3 = cfg.i3Config;
    programs.i3status-rust = cfg.i3StatusRustConfig;
    home.sessionVariables = cfg.sessionVariables;
    xdg.configFile."dunst/dunstrc".text = builtins.readFile ../static-files/configs/dunstrc;
  };
}
