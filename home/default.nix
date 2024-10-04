{
  pkgs,
  inputs,
  ...
}: let
  neovim-flake = inputs.neovim-flake.packages.${pkgs.system}.default;
  homeSessionVariables = import ./home-session-variables.nix {};

  bartib = pkgs.runCommand "bartib-wrapped" {nativeBuildInputs = [pkgs.makeWrapper];} ''
    mkdir -p $out/bin
    makeWrapper ${pkgs.bartib}/bin/bartib $out/bin/bartib-wrapped \
      --set BARTIB_FILE /home/andrew/sync/thoughts/storage/bartib.bartib
  '';
in {
  imports = [
    ./programs/atuin.nix
    ./programs/git.nix
    ./programs/zsh.nix

    #./syncthing.nix
  ];

  home.username = "andrew";
  home.homeDirectory =
    if pkgs.system == "aarch64-darwin"
    then "/Users/andrew"
    else "/home/andrew";

  home.packages =
    (with pkgs; [
      # 3.0.13
      #openssl
      atuin
      neovim

      ## web ui / gui apps
      ##discord
      ##slack
      #syncthing
      #yt-dlp
      ##zoom-us
      #foliate # epub reader

      ## rust coreutils alternatives & just rust programs
      #bat
      #bat-extras.batgrep
      fd
      just
      lsd
      ripgrep
      sd
      #vimv-rs
      #wthrr

      ## system tools
      #btop
      #file
      #gavin-bc
      #gnupg
      #lsof
      #which
      #pciutils

      ## networks
      #dnsutils # dig + nslookup
      #iperf3
      #ldns # dig alternative
      #nmap
      #socat

      #entr
      #fzf
      #git-lfs
      #gron
      #kubectl
      jq
      #libiconv
      #tmux
      #tree

      ## linters / LSPs
      #marksman
      #shellcheck
      #yamllint
      #eslint_d

      ## compression
      #p7zip
      #unzip
      #xz
      #zip

      ## fun
      #macchina
    ])
    ++ [
      bartib
      neovim-flake
    ];

  home.sessionVariables = homeSessionVariables;

  programs.home-manager.enable = true;
  manual.manpages.enable = true;

  home.stateVersion = "24.05";
}
