{ config, pkgs, lib, inputs, ... }:
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
    # 3.0.13
    openssl
    python312

    syncthing
    slack
    zoom-us
    discord
    gavin-bc

    inputs.neovim-flake.packages.${pkgs.system}.default

    apacheHttpd
    awscli
    bat
    caddy
    docker
    entr
    git-lfs
    go
    gron
    just
    kubectl
    libiconv
    macchina
    rustup
    tmux
    tree
    trino-cli
    wthrr

    marksman
    ruff
    shellcheck
    yamllint

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
    (pkgs.buildEnv { name = "az-personal-scripts"; paths = [ ../static-files ]; })
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

  programs.home-manager.enable = true;
  manual.manpages.enable = true;

  home.stateVersion = "23.11";
}
