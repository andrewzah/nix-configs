{pkgs}: {
  home.packages = [
    pkgs.hyprpaper
  ];

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
      "libinput-gestures &"
    ];
    general = {
      gaps_in = 2;
      gaps_out = 2;
      border_size = 2;
      "col.active_border" = "rgba(fabd2fee) rgba(fabd2fee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";
    };
    gestures = {
      workspace_swipe = true;
      workspace_swipe_fingers = 3;
      workspace_swipe_min_fingers = 3;
      workspace_swipe_distance = 100;
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
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"
        "$mod, Q, focuscurrentorlast"
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
        "$mod CONTROL, E, exec, wofi-emoji"
        "$mod SHIFT, R, exec, hyperctl reload"
        "$mod CONTROL_L, K, killactive"
        ", F6, exec, brightnessctl set 5%-"
        ", F7, exec, brightnessctl set +5%"
        ", F1, exec, wpctl set-mute 44 toggle"
        ", F2, exec, wpctl set-volume 44 5%-"
        ", F3, exec, wpctl set-volume 44 5%+"
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

    # disable the anime girl wallpaper
    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
    };
  };

  xdg.configFile."hypr/hyprpaper.conf".text = builtins.readFile ../static-files/configs/hyprpaper.conf;
}
