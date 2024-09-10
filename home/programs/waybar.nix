{...}: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        height = 35;
        layer = "top";
        position = "top";
        tray = {spacing = 10;};
        modules-left = [
          "clock"
          "hyprland/workspaces"
        ];
        modules-center = ["hyprland/window"];
        modules-right = [
          "disk"
          "memory"
          "cpu"
          "custom/volume"
          "battery"
          #"hyprland/language"
        ];

        cpu = {
          format = "CPU {usage:2}%";
          interval = 3;
          states = {
            critical = 90;
            warning = 70;
          };
        };
        memory = {
          format = "MEM {}%";
          interval = 3;
          states = {
            critical = 90;
            warning = 70;
          };
        };

        "custom/volume" = {
          interval = 1;
          exec = "/etc/nixos/static-files/bin/pipewire-get-volume.sh";
          max-length = 15;
          return-type = "json";
        };

        disk = {
          interval = 30;
          format = "/: {percentage_used}%";
          path = "/";
        };

        "battery" = {
          format = "BAT {capacity}%";
        };

        "clock" = {
          interval = 60;
          format = "{:%a, %b %d | %H:%M | W %V}";
        };

        "hyprland/language" = {
          format = "KBR {}";
          keyboard-name = "at-translated-set-2-keyboard";
        };
      }
    ];

    style = builtins.readFile ../../static-files/configs/waybar-style.css;
  };
}
