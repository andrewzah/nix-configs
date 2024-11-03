{pkgs, ...}: {
  imports = [
    ./waybar.nix
  ];
  home.packages = with pkgs; [
    sway
  ];

  home.sessionVariables = {
    XDG_DEFAULT_LAYOUT = "us";
  };

  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    package = null;

    config = let
      swaymsg = "${pkgs.sway}/bin/swaymsg";
      modifier = "Mod4";
      terminal = "foot";
    in {
      inherit modifier terminal;
      fonts.names = ["Iosevka SS03"];
      menu = "rofi";
      keybindings = {
        "${modifier}+Space" = "exec rofi -show run";
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+g" = "floating toggle";
        "${modifier}+b" = "splith";
        "${modifier}+v" = "splitv";
        "${modifier}+a" = "focus parent";
        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";

        "${modifier}+Tab" = "workspace next";
        "${modifier}+Shift+Tab" = "workspace prev";

        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";

        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";

        "${modifier}+Shift+e" = "exec ${pkgs.smile}/bin/smile";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+Shift+Escape" = "exec ${swaymsg} exit";
        "${modifier}+Return" = "exec ${terminal}";

        "F6" = "exec brightnessctl set 5%-";
        "F7" = "exec brightnessctl set +5%";
        "F1" = "exec wpctl set-mute 44 toggle";
        "F2" = " exec wpctl set-volume 44 5%-";
        "F3" = " exec wpctl set-volume 44 5%+";
        "F10" = " exec screenshot-tmp-fullscreen.sh";
        "XF86Copy" = "exec wl-copy";
        "XF86Paste" = "exec wl-paste";

        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";

        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";
      };

      modes.resize = {};

      input = {"*" = {xkb_layout = "us,kr";};};

      seat = {
        "*" = {
          xcursor_theme = "Bibata-Modern-Classic 32";
        };
      };

      gaps = {
        inner = 0;
        smartGaps = false;
      };

      startup = [
        {
          always = true;
          command = "fcitx5 &";
        }
        {
          always = true;
          command = "mako &";
        }
        {command = "swaymsg -s $SWAYSOCK output eDP-1 bg /etc/nixos/static-files/wallpapers/DF-1.png fill";}
      ];

      bars = [
        {
          position = "bottom";
          command = "${pkgs.waybar}/bin/waybar";
        }
      ];
    };
  };
}
