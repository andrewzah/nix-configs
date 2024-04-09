{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    firefox

    font-awesome

    keyd

    ethtool
    firefox
    lm_sensors
    ltrace
    strace
    sysstat
    usbutils
  ];
}
