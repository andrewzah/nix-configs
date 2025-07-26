{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.userExtraServices.ghostty-daemon;
in {
  options.userExtraServices.ghostty-daemon = {
    enable = mkEnableOption "Ghostty terminal emulator daemon for instant startup";
  };
  config = mkIf cfg.enable {
    systemd.user.services.ghostty-daemon = {
      description = "Ghostty terminal daemon";

      after = ["graphical-session-pre.target"];
      partOf = ["graphical-session.target"];
      wantedBy = ["graphical-session.target"];

      serviceConfig = {
        Type = "exec";
        ExecStart = "${pkgs.ghostty}/bin/ghostty --gtk-single-instance=true --class=ghostty-daemon";
        Restart = "on-failure";
        RestartSec = 5;
      };

      #Environment = [
      #"WAYLAND_DISPLAY=wayland-1"
      #];
    };
  };
}
