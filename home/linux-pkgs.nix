{pkgs, ...}: {
  imports = [
    ./games/dwarf-fortress-classic.nix
    ./fonts.nix
    ./audio.nix
  ];

  home.packages = with pkgs; [
    mullvad-vpn

    unar
    poppler
    yazi
    ffmpeg_7-headless
    vbam # visualboyadvance-m

    bluez
    blueman

    trivy
    syft
    grype
    cosign

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

    tiny

    dracut
    acpi
    dmidecode
    ethtool
    lm_sensors
    sysstat
    usbutils

    ltrace
    strace
    pstree
    dstat
    tcpdump
    ngrep
    bingrep

    (callPackage ../packages/andrew-zah-scripts.nix {})
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

  xdg.configFile."tiny/config.yml".text = builtins.readFile ../static-files/configs/tiny-irc.yml;
  #xdg.configFile."ncmcpp/config".text = builtins.readFile ../static-files/configs/ncmcpp.conf;
}
