{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../common.nix
      ../common-linux.nix
      ./hardware-configuration.nix
    ];

  programs.hyprland.enable = true;
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiIntel
    ];
  };

  systemd.services = {
    keyd = {
      enable = true;
      unitConfig = {
        Requires = "local-fs.target";
        After = "local-fs.target";
      };
      serviceConfig = {
        Type = "simple";
	ExecStart = "${pkgs.keyd}/bin/keyd";
      };
    };
  };
  environment.etc."keyd/default.conf".text = ''
  [ids]
  *

  [main]
  capslock = overload(control, esc)
  esc = capslock
  '';

  networking.hostName = "xps9360";
  system.stateVersion = "23.11";
}
