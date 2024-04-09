{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    waybar
    wev
    wofi
    wofi-emoji
  ];

  wayland.windowManager.hyprland.enable = true;
  # https://github.com/JaKooLit/Hyprland-v3/blob/main/config/hypr/configs/Keybinds.conf
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "animation" = "workspaces,0";
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
        "$mod, Space, exec, wofi"
        "$mod, Tab, layoutmsg, cyclenext"
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
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
  };

  programs.waybar = {
    enable = true;
    settings = [{
      height = 30;
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
  };
}
