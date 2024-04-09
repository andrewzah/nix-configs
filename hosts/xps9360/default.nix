{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../common.nix
      ../common-linux.nix
      ./hardware-configuration.nix
    ];

  programs.hyprland.enable = true;

  networking.hostName = "xps9360";
  system.stateVersion = "23.11";
}
