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

  cfg = config.zah-hm.graphics.i3status-rust;
  i3config = config.zah-hm.graphics.i3;
  # bars =
in {
  options.zah-hm.graphics.i3status-rust = with types; {
    enable = mkEnableOption "enable i3status-rust";
    package = mkOption {
      description = "the package to use for i3status-rust";
      type = package;
      default = pkgs.i3status-rust;
    };

    config = mkOption {
      description = "config for programs.i3status-rust";
      type = attrs;
      default = {
        bars.top = {
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
              block = "temperature";
              format = "$max max";
              interval = 10;
              chip = "*-isa-*";
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
    };
  };

  config = mkIf (cfg.enable
    && i3config.enable) {
    programs.i3status-rust =
      {
        enable = true;
      }
      // cfg.config;

    zah-hm.graphics.i3.bars = [
      {
        trayOutput = "eDP-1";
        position = "top";
        statusCommand = "${lib.getExe cfg.package} /home/${username}/.config/i3status-rust/config-top.toml";
      }
    ];
  };
}
