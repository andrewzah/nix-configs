{pkgs, ...}: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./fonts.nix
    ./games.nix
    ./video.nix

    ./programs/firefox.nix
  ];

  home.packages = with pkgs; [
    appimage-run
    mullvad-vpn

    unar
    poppler # ?
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
    sshfs

    pinentry-curses # GPG entry
    xfce.thunar # GTK file browser
    yazi # TUI file browser
    libnotify
    xdg-utils

    keyd
    pass

    tiny # IRC

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
    (callPackage ../packages/rbonsai.nix {})
    (callPackage ../packages/cider-wrapper.nix {})
  ];

  home.pointerCursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    gtk.enable = true;
  };

  xdg.configFile."tiny/config.yml".text = builtins.readFile ../static-files/configs/tiny-irc.yml;
}
