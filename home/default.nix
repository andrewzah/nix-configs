{
  pkgs,
  inputs,
  ...
}: let
  neovim-flake = inputs.neovim-flake.packages.${pkgs.system}.default;
in {
  imports = [
    ./programs/atuin.nix
    ./programs/git.nix
    ./programs/zsh.nix

    #./programs/vscode.nix
    #./syncthing.nix
  ];

  home.username = "dragon";
  home.homeDirectory =
    if pkgs.system == "aarch64-darwin"
    then "/Users/andrew"
    else "/home/dragon";

  home.packages =
    (with pkgs; [
      # 3.0.13
      openssl
      wireguard-go
      wireguard-tools

      anki
      nix-tree

      # web ui / gui apps
      bitwarden-desktop
      syncthing
      vlc
      yt-dlp
      foliate # epub reader

      ## rust coreutils alternatives & just rust programs
      bat
      #bat-extras.batgrep
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
      git-lfs
      gron
      kubectl
      jq
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
