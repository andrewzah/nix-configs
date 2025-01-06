{
  pkgs,
  lib,
  inputs,
  username,
  ...
}: let
  neovim-flake = inputs.neovim-flake.packages.${pkgs.system}.default;
in {
  home.username = "${username}";
  home.homeDirectory = lib.mkDefault "/home/${username}";

  imports = [
    ./programs/anki.nix
    ./programs/atuin.nix
    ./programs/firefox.nix
    ./programs/git.nix
    ./programs/tiny.nix
    ./programs/zsh.nix

    ./fonts.nix
    ./work.nix

    #./programs/vscode.nix
    #./syncthing.nix
  ];

  home.packages =
    (with pkgs; [
      openssl
      wireguard-go
      wireguard-tools

      nix-tree
      alejandra

      # web ui / gui apps
      bitwarden-desktop
      #syncthing
      vlc
      yt-dlp
      foliate # epub reader

      ## rust coreutils alternatives & just rust programs
      bat
      fd
      just
      lsd
      ripgrep
      sd
      vimv-rs

      ## system tools
      #btop
      file
      gavin-bc
      gnupg
      lsof
      which
      pciutils

      # networks
      dnsutils # dig + nslookup
      iperf3
      ldns # dig alternative
      nmap
      socat
      inetutils # telnet

      entr
      fzf
      jq
      git-lfs
      gron
      libiconv
      tmux
      tree

      ## linters / LSPs
      marksman
      shellcheck
      yamllint
      eslint_d

      ## compression
      p7zip
      unzip
      xz
      zip

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

      (callPackage ../pkgs/andrew-zah-scripts.nix {})
      (callPackage ../pkgs/rbonsai.nix {})
      (callPackage ../pkgs/cider-wrapper.nix {})
      (callPackage ../pkgs/intentrace.nix {})
    ])
    ++ [
      neovim-flake
    ];

  home.sessionVariables = {
    EDITOR = "nvim";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im,fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
    XCURSOR_SIZE = "108";
    XKB_DEFAULT_LAYOUT = "us";
  };

  programs.home-manager.enable = true;
  manual.manpages.enable = true;

  home.stateVersion = "24.05";
}
