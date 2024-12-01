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
    alacritty

    bitwarden-desktop

    vlc

    appimage-run
    mullvad-vpn
    tailscale

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

    (callPackage ../pkgs/andrew-zah-scripts.nix {})
    (callPackage ../pkgs/rbonsai.nix {})
    (callPackage ../pkgs/cider-wrapper.nix {})
    (callPackage ../pkgs/intentrace.nix {})
  ];

  home.pointerCursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    gtk.enable = true;
  };

  xdg.configFile."tiny/config.yml".text = builtins.readFile ../static-files/configs/tiny-irc.yml;
}
