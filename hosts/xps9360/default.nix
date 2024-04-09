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

  networking.hostName = "xps9360";
  system.stateVersion = "23.11";
}
