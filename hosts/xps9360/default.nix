{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../common/default.nix
      ../common-linux/default.nix
      ../../home/wayland.nix
      ./hardware-configuration.nix
    ];

  networking.hostName = "xps9360";
  system.stateVersion = "23.11";
}
