{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    hyprpaper
    waybar
    wev
    rofi-wayland
    wofi
    wofi-emoji
    wtype

    grim
    slurp
    wl-clipboard
    mako
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
      "foot --server &"
      "mako &"
    ]; 
    general = {
      gaps_in = 2;
      gaps_out = 2;
      border_size = 2;
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
        "$mod, J, movefocus, l"
        "$mod, K, movefocus, r"
        "$mod, H, movefocus, u"
        "$mod, L, movefocus, d"
        "$mod SHIFT, J, movewindow, l"
        "$mod SHIFT, K, movewindow, r"
        "$mod SHIFT, H, movewindow, u"
        "$mod SHIFT, L, movewindow, d"
        "$mod, Escape, exec, hyperctl kill"
        "$mod, Return, exec, foot"
        "$mod, Space, exec, rofi -show run"
        "$mod SHIFT, B, exec, rofi -show window"
        "$mod, Tab, layoutmsg, cyclenext"
        "$mod, mouse:272, movewindow"
        #"$mod, mouse:273, resizewindow"
        "$mod ALT, E, exec, wofi-emoji"
        "$mod SHIFT, R, exec, hyperctl reload"
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
    env = [
      "GTK_IM_MODULE,fcitx"
      "QT_IM_MODULE,fcitx"
      "XMODIFIERS,@im,fcitx"
      "SDL_IM_MODULE,fcitx"
      "GLFW_IM_MODULE,ibus"
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
        "hyprland/language"
        "battery"
        "clock"
      ];

      "clock" = {
        interval = 60;
        format = "{:%H:%M}";
        max-length = 25;
      };
    }];

    style = (builtins.readFile ../static-files/waybar-style.css);
  };

  xdg.configFile."foot/foot.ini".text = (builtins.readFile ../static-files/foot.ini);

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/Downloads/nix.png
    wallpaper = ,~/Downloads/nix.png
    ipc=true
    splash=false
  '';
}
