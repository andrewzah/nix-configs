{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    # utilities
    hyprpaper
    waybar
    rofi-wayland
    swaylock

    # emojis
    wofi
    wofi-emoji
    wtype

    # screenshots / clipboard
    grim
    slurp
    wl-clipboard

    # notifs
    mako

    # misc
    wev
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    WLR_NO_HARDWARE_CURSORS = "1";
    XCURSOR_SIZE = "108";
    XKB_DEFAULT_LAYOUT = "en,us";
  };

  wayland.windowManager.hyprland.enable = true;
  # https://github.com/JaKooLit/Hyprland-v3/blob/main/config/hypr/configs/Keybinds.conf
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "animation" = "workspaces,0";
    "exec-once" = [
      "waybar &"
      "hyprpaper &"
      "fcitx5 &"
      "mako &"
    ];
    general = {
      gaps_in = 2;
      gaps_out = 2;
      border_size = 2;
      "col.active_border" = "rgba(fabd2fee) rgba(fabd2fee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";
    };
    windowrule = [
      "float, dialog"
      "float, file_progress"
      "float, confirm"
      "float, confirmreset"
    ];
    bind =
      [
        "$mod, F, fullscreen"
        "$mod, G, togglefloating"
        "$mod, Q, killactive"
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, J, movewindow, d"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, L, movewindow, r"
        "$mod, Escape, exec, hyperctl kill"
        "$mod, Return, exec, foot"
        "$mod, Space, exec, rofi -show run"
        "$mod SHIFT, B, exec, rofi -show window"
        "$mod, Tab, layoutmsg, cyclenext"
        "$mod, mouse:272, movewindow"
        #"$mod, mouse:273, resizewindow"
        "$mod ALT, E, exec, wofi-emoji"
        "$mod SHIFT, R, exec, hyperctl reload"
        ", F6, exec, brightnessctl set 2.5%-"
        ", F7, exec, brightnessctl set +2.5%"
        ", F1, exec, wpctl set-mute 47 toggle"
        ", F2, exec, wpctl set-volume 47 2.5%-"
        ", F3, exec, wpctl set-volume 47 2.5%+"
        ", F10, exec, screenshot-tmp-fullscreen.sh"
        ", XF86Copy, exec, wl-copy"
        ", XF86Paste, exec, wl-paste"
      ]
      ++ (
        builtins.concatLists (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        )
        10)
      );
    # "GTK_IM_MODULE,fcitx"
    env = [
      "QT_IM_MODULE,fcitx"
      "XMODIFIERS,@im,fcitx"
      "SDL_IM_MODULE,fcitx"
      "GLFW_IM_MODULE,ibus"
      "XCURSOR_SIZE,108"
    ];
  };

  programs.waybar = {
    enable = true;
    settings = [{
      height = 35;
      layer = "top";
      position = "bottom";
      tray = { spacing = 10; };
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [
        "custom/volume"
        "battery"
        "clock"
        "sway/language"
      ];

      "custom/volume" = {
        interval = 10;
        exec = "/etc/nixos/static-files/bin/pipewire-get-volume.sh";
        max-length = 15;
        return-type = "json";
      };

      "battery" = {
        format = "BAT {capacity}%";
      };

      "clock" = {
        interval = 60;
        format = "{:%A | %H:%M | Week %V}";
        max-length = 40;
      };

      "sway/language" = {
        format = "{short} {variant}";
      };
    }];

    style = (builtins.readFile ../static-files/configs/waybar-style.css);
  };

  xdg.configFile."foot/foot.ini".text = (builtins.readFile ../static-files/configs/foot.ini);
  xdg.configFile."hypr/hyprpaper.conf".text = (builtins.readFile ../static-files/configs/hyprpaper.conf);
}
