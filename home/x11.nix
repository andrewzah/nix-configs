{pkgs, ...}: {
  home.packages = (with pkgs; [
    discord
    discordchatexporter-cli
    rofi
  ]);

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = let
      modifier = "Mod1";
      terminal = "alacritty";
    in {
      inherit modifier terminal;
      startup = [
        {
          command = ''
          ${pkgs.xorg.xrandr} \
            --output DP-0 \
              --mode 3440x1440 \
              --pos 1440x0 \
              --rotate normal \
            --output DP-1 --off \
            --output HDMI-0 --off \
            --output DP-2 \
              --mode 2560x1440 \
              --pos 0x199 \
              --rotate right \
            --output DP-3 --off \
            --output DP-4 \
              --primary \
              --mode 2560x1440 \
              --rate 144 \
              --pos 1440x1440 \
              --rotate normal \
            --output DP-5 --off \
            --output USB-C-0 --off
          '';
          always = true;
          notification = false;
        }
      ];
      gaps = {
        inner = 0;
        #outer = 2;
      };
      keybindings = {
        "${modifier}+d" = "exec rofi -show run";
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
        "${modifier}+Return" = "exec ${terminal}";
        "${modifier}+Shift+Escape" = "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";

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

        #modes.resize = {};
        #input = {"*" = {xkb_layout = "us,kr"; }; };
      };
    };
  };

  home.sessionVariables = {
    #XCURSOR_SIZE = "108";
    XKB_DEFAULT_LAYOUT = "us";

    GLFW_IM_MODULE = "ibus";
    GTK_IM_MODULE = "fcitx";
    IMSETTINGS_MODULE = "fcitx";
    INPUT_METHOD = "fcitx";
    QT_IM_MODULE = "fcitx";
    SDL_IM_MODULE = "fcitx";
    XMODIFIERS = "@im,fcitx";
  };
}