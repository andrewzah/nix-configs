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

  #{pkgs, ...}: let
  #  a = {
  #  };
  #in {
  programs.foot = {
    enable = true;
    #settings = {
    #  main = {
    #    include = "";
    #  };
    #};
  };

  programs.firefox.enable = true;
  programs.firefox.profiles = {
    myuser = {
      id = 0;
      settings = {
        "media.ffmpeg.vaapi.enabled" = true;
        "media.ffvpx.enabled" = true;
        "media.av1.enabled" = true;
        "gfx.webrender.all" = true;
      };
    };
  };
}
