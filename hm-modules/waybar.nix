{
  pkgs,
  lib,
  config,
  username,
  ...
}: let
  inherit
    (lib)
    mkIf
    mkOption
    mkEnableOption
    types
    ;

  cfg = config.zah-hm.graphics.waybar;
in {
  options.zah-hm.graphics.waybar = with types; {
    enable = mkEnableOption "enable waybar.";
    package = mkOption {
      type = package;
      default = pkgs.waybar;
    };
    settings = mkOption {
      type = listOf attrs;
      default = [
        {
          height = 30;
          layer = "top";
          position = "top";
          tray = {spacing = 10;};
          modules-left = [
            "clock"
            "niri/window"
          ];
          modules-center = [
            "niri/workspaces"
            "privacy"
          ];
          modules-right = [
            "custom/volume"
            "disk"
            "memory"
            "cpu"
            "battery"
            "network"
            "tray"
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
            interval = 10;
            states = {
              critical = 90;
              warning = 70;
            };
          };

          memory = {
            format = "MEM {}%";
            interval = 10;
            states = {
              critical = 90;
              warning = 70;
            };
          };

          "custom/volume" = {
            interval = 60;
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
            interval = 60;
            format = "BAT {capacity}% ({time})";
            format-charging = "BAT+ {capacity}% ({time})";
            format-discharging = "BAT- {capacity}% ({time}";
            states = {
              "warning" = 30;
              "critical" = 15;
            };
          };

          "clock" = {
            interval = 60;
            format = "{:%a, %b %d | %H:%M | W %V}";
          };

          "network" = {
            interval = 3;
            interface = "wlp194s0";
            format-wifi = "{essid} - {ipaddr}/{cidr} ({signalStrength}%)";
            format-ethernet = "{ipaddr}/{cidr}";
            format-disconnected = "";
            tooltip-format = "{ifname} via {gwaddr}";
            tooltip-format-ethernet = "{ifname}";
          };
        }
      ];
    };

    style = mkOption {
      description = "waybar css";
      type = str;
      default = builtins.readFile ../static-files/configs/waybar-style.css;
    };
  };

  config = mkIf cfg.enable {
    home.packages = [cfg.package];
    programs.waybar = {
      enable = true;
      settings = cfg.settings;
      style = cfg.style;
    };
  };
}
