{ config, pkgs, lib, ... }:
{
  imports = [
    ./atuin.nix
    #./syncthing.nix
  ];

  home.username = "andrew";
  home.homeDirectory =
    if pkgs.system == "aarch64-darwin"
    then "/Users/andrew"
    else "/home/andrew";

  home.packages = with pkgs; [
    syncthing
    slack
    zoom-us
    discord

    tmux
    just
    docker
    go
    rustup
    libiconv
    git-lfs
    awscli
    entr
    kubectl

    macchina
    tree

    p7zip
    unzip
    xz
    zip

    fzf
    jq
    lsd
    ripgrep
    vimv-rs

    dnsutils # dig + nslookup
    iperf3
    ldns     # dig alternative
    nmap
    socat

    file
    gnupg
    which

    btop
    lsof

    pciutils

    # my scripts
    (pkgs.buildEnv { name = "az-personal-scripts"; paths = [ ../scripts ]; })
  ];

  programs.git = {
    enable = true;
    userName = "Andrew Zah";
    userEmail = "zah@andrewzah.com";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      v = "nvim";
      j = "just";
      k = "kubectl";
      ll = "ls -la";

      gpod = "git push origin dev";
      gpodr = "git pull origin dev --rebase";
      gpom = "git push origin master";
      gpomr = "git pull origin master --rebase";
    };
  };

  home.sessionVariables.EDITOR = "nvim";
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.home-manager.enable = true;
  manual.manpages.enable = true;

  home.stateVersion = "23.11";
}
