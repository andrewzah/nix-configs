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

    gavin-bc
    gron
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
      ll = "lsd -la --icon never";

      dc = "docker compose";
      dps = "docker ps";
      dil = "docker image ls";
      deit = "docker exec -it";
      drri = "docker run --rm -it";
      drrie = "docker run --rm -it --entrypoint=/usr/bin/env bash";

      gpod = "git push origin dev";
      gpodr = "git pull origin dev --rebase";
      gpom = "git push origin master";
      gpomr = "git pull origin master --rebase";
    };

    initExtra = ''
      #PROMPT=" (%?) [%n@%m:%2/] λ "
      export PROMPT=" %F{yellow}(%?:%j - %T)%F{cyan} %3~ %F{#FFFFFF}λ "
    '';
  };

  home.sessionVariables.EDITOR = "nvim";
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.home-manager.enable = true;
  manual.manpages.enable = true;

  home.stateVersion = "23.11";
}
