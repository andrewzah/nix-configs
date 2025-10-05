{
  pkgs,
  username,
  ...
}: {
  home.packages = [pkgs.waybar];

  programs.waybar = {
    enable = true;
    settings = [
      {
        height = 30;
        layer = "top";
        position = "top";
        tray = {spacing = 10;};
        modules-left = [
          "clock"
          "niri/window"
        ];
        modules-center = ["niri/workspaces"];
        modules-right = [
          "disk"
          "memory"
          "cpu"
          "custom/volume"
          "battery"
        ];

        "niri/window" = {
          max-length = 50;
          format = "{app_id}";
          separate-outputs = true;
          rewrite = {
            "com.mitchellh.ghostty" = "<span>Ghostty</span>";
            "code" = "<span>VS Code</span>";
            "firefox" = "<span>Firefox</span>";
            "thunderbird" = "<span>Thunderbird</span>";
            "org.pulseaudio.pavucontrol" = "<span>Pavucontrol</span>";
            "(.*)" = "<span>$1</span>";
          };
        };

        "niri/workspaces" = {
          all-outputs = false;
          on-click = "activate";
          current-only = false;
          disable-scroll = false;
          format = "<span><b>{icon}</b></span>";
          format-icons = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六";
            "7" = "七";
            "8" = "八";
            "9" = "九";
            "10" = "十";
          };
        };

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
          exec = "/home/${username}/nix/static-files/bin/pipewire-get-volume.sh";
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
      }
    ];

    style = builtins.readFile ../../static-files/configs/waybar-style.css;
  };
}
