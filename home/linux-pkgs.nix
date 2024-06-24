{ pkgs, ... }:
{
  imports = [
    ./games/dwarf-fortress-classic.nix
  ];

  home.packages = with pkgs; [
    unar
    poppler
    yazi
    ffmpeg_7-headless

    foot
    firefox
    ungoogled-chromium
    thunderbird-unwrapped
    obsidian

    killall
    pavucontrol
    brightnessctl
    lsix
    dive
    unixtools.xxd
    sshfs

    pinentry-curses
    xfce.thunar
    libnotify
    xdg-utils

    keyd
    pass

    acpi
    dmidecode
    ethtool
    lm_sensors
    ltrace
    strace
    sysstat
    usbutils

    (pkgs.callPackage ../packages/iosevka-consolas-ttf.nix {})
    (pkgs.callPackage ../packages/andrew-zah-scripts.nix {})
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
