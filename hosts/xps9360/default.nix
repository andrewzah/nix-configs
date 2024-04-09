{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../common.nix
      ../common-linux.nix
      ./hardware-configuration.nix
    ];

  programs.hyprland.enable = true;
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [{
      height = 30;
      layer = "top";
      position = "bottom";
      tray = { spacing = 10; };
    }];
  };

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiIntel
    ];
  };

  networking.hostName = "xps9360";
  system.stateVersion = "23.11";
}
