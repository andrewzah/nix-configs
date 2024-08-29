{pkgs, ...}: {
  home.packages = [
    pkgs.mediainfo
    pkgs.handbrake
    pkgs.losslesscut-bin

    # dvd ripping
    pkgs.makemkv
    pkgs.libdvdcss
    pkgs.libdvdnav
    pkgs.libdvdread
  ];
}
