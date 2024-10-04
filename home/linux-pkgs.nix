{pkgs, ...}: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./fonts.nix
    ./games.nix
    ./video.nix
    ./work.nix

    ./programs/firefox.nix
    ./programs/git.nix
  ];

  home.packages = with pkgs; [
    bitwarden-desktop

    vlc

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
    dust

    pinentry-curses # GPG entry
    xfce.thunar # GTK file browser
    yazi # TUI file browser
    libnotify
    xdg-utils

    keyd
    pass

    tiny # IRC

    dracut
    dmidecode
    ethtool
    lm_sensors
    sysstat
    usbutils

    # power management
    acpi
    tlp
    powertop

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
