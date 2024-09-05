{...}: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        height = 35;
        layer = "top";
        position = "top";
        tray = {spacing = 10;};
        modules-left = ["hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = [
          "custom/volume"
          "battery"
          "clock"
          "sway/language"
        ];

        "custom/volume" = {
          interval = 1;
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
      }
    ];

    style = builtins.readFile ../../static-files/configs/waybar-style.css;
  };
}
