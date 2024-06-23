{ pkgs, inputs, stateVersion, ... }:
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

    (python312.withPackages (ps:
      with ps; [
        python-lsp-server
        python-lsp-ruff
    ]))

    # web ui / gui apps
    bitwarden-desktop
    discord
    slack
    syncthing
    vlc
    yt-dlp
    zoom-us

    # development
    inputs.neovim-flake.packages.${pkgs.system}.default

    # langs
    go

    # rust coreutils alternatives & just rust programs
    bat
    bat-extras.batgrep
    fd
    just
    lsd
    ripgrep
    sd
    vimv-rs
    wthrr

    # system tools
    btop
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

    apacheHttpd
    awscli
    caddy
    docker
    entr
    fzf
    git-lfs
    gron
    kubectl
    jq
    libiconv
    macchina
    tmux
    tree
    trino-cli

    # linters / LSPs
    marksman
    shellcheck
    yamllint

    # compression
    p7zip
    unzip
    xz
    zip
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
      drrie = "docker run --rm -it --entrypoint='/bin/bash'";

      gpod = "git push origin dev";
      gpodr = "git pull origin dev --rebase";
      gpom = "git push origin master";
      gpomr = "git pull origin master --rebase";

      ta = "tmux attach";
      tat = "tmux attach -t";
    };

    initExtra = ''
      #PROMPT=" (%?) [%n@%m:%2/] λ "
      export PROMPT=" %F{yellow}(%? - %T)%F{cyan} %3~ %F{#FFFFFF}λ "

      # foot doesn't consider these valid by default
      bindkey "\e[27;2;13~" accept-line  # shift+return
      bindkey "\e[27;5;13~" accept-line  # ctrl+return

      function preexec {
          print -Pn "\e]0;''${(q)1}\e\\"
      }
    '';
  };

  home.sessionVariables.EDITOR = "nvim";

  programs.home-manager.enable = true;
  manual.manpages.enable = true;

  home.stateVersion = stateVersion;
}
