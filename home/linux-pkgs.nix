{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    firefox
    ethtool
    firefox
    lm_sensors
    ltrace
    strace
    sysstat
    usbutils
  ];
}
