{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    discordchatexporter-cli
    rofi
    xclip
  ];

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = let
      modifier = "Mod4"; # alt=Mod1, gui=Mod4
      terminal = "alacritty";
    in {
      inherit modifier terminal;
      startup = [
        {
          command = "fcitx5 -d";
          always = true;
          notification = true;
        }
        {
          command = "${pkgs.dunst}/bin/dunst";
          always = true;
          notification = true;
        }
      ];
      gaps = {
        inner = 0;
        #outer = 2;
        smartBorders = "on";
      };
      bars = [
        #{
        #  trayOutput = "eDP-1";
        #  position = "bottom";
        #  statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs /home/dragon/.config/i3status-rust/config-bottom.toml";
        #}
      ];
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

        "${modifier}+Control+h" = "resize shrink width 10 px or 10 ppt";
        "${modifier}+Control+j" = "resize grow height 10 px or 10 ppt";
        "${modifier}+Control+k" = "resize shrink height 10 px or 10 ppt";
        "${modifier}+Control+l" = "resize grow width 10 px or 10 ppt";

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

        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 4%-";
        "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 4%+";

        "XF86AudioRaiseVolume" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +10%";
        "XF86AudioLowerVolume" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -10%";
        "XF86AudioMute" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-source-mute @DEFAULT_SOURCE@ toggle";

        "Print" = "exec screenshot-tmp-fullscreen.sh";
        "NoSymbol" = "exec screenshot-tmp.sh";
      };
    };
    extraConfig = ''
      #workspace 1 output DP-4
      #workspace 2 output DP-2
      #workspace 10 output DP-0

      # todo: more proper colorscheme considerations
      # gruvbox green is meh
      #set $green #98971a
      ##set $green #259d2f
      #set $bg #282828
      #set $red #cc241d
      #set $yellow #d79921
      #set $blue #458588
      #set $purple #b16286
      #set $aqua #689d68
      #set $gray #a89984
      #set $darkgray #1d2021

      #green gruvbox
      # class                 border |  backgr |  text |    indic | child_border
      #client.focused          $green    $green    $darkgray $purple $darkgray
      #client.focused_inactive $darkgray $darkgray $yellow   $purple $darkgray
      #client.unfocused        $darkgray $darkgray $white    $purple $darkgray
      #client.urgent           $red      $red      $white    $red    $red

      # blue gruvbox
      # class                 border |  backgr |  text |    indic | child_border
      #client.focused          $blue $blue $white $purple $darkgray
      #client.focused_inactive $darkgray $darkgray $white $purple $darkgray
      #client.unfocused        $darkgray $darkgray $white $purple $darkgray
      #client.urgent           $red $red $white $red $red
    '';
  };

  programs.i3status-rust = {
    enable = true;
    bars.bottom = {
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

  home.sessionVariables = {
    XCURSOR_SIZE = "182";
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
#{
#  command = ''
#    ${pkgs.xorg.xrandr}/bin/xrandr \
#      --output DP-0 \
#        --mode 3440x1440 \
#        --pos 1440x0 \
#        --rotate normal \
#      --output DP-1 --off \
#      --output HDMI-0 --off \
#      --output DP-2 \
#        --mode 2560x1440 \
#        --pos 0x199 \
#        --rotate right \
#      --output DP-3 --off \
#      --output DP-4 \
#        --primary \
#        --mode 2560x1440 \
#        --rate 144 \
#        --pos 1440x1440 \
#        --rotate normal \
#      --output DP-5 --off \
#    --output USB-C-0 --off
#  '';
#  always = true;
#  notification = true;
#}

