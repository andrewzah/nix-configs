{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    foot
    firefox
    ungoogled-chromium
    thunderbird-unwrapped

    killall
    pavucontrol
    brightnessctl
    lsix

    xfce.thunar
    libnotify
    xdg-utils

    keyd

    acpi
    dmidecode
    ethtool
    lm_sensors
    ltrace
    strace
    sysstat
    usbutils

    (pkgs.callPackage ../packages/iosevka-consolas-ttf.nix {})
  ];

  home.pointerCursor.gtk.enable = true;
  home.pointerCursor.package = pkgs.vanilla-dmz;
  home.pointerCursor.name = "Vanilla-DMZ";

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
