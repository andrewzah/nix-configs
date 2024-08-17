{ pkgs, inputs, stateVersion, ... }:
let
  shellAliases = (import ./shell-aliases.nix{}).aliases;

  neovim-flake = inputs.neovim-flake.packages.${pkgs.system}.default;
in
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

  home.packages = (with pkgs; [
    # 3.0.13
    openssl

    (python312.withPackages (ps:
      with ps; [
        python-lsp-server
        python-lsp-ruff
    ]))

    # web ui / gui apps
    bitwarden-desktop
    #discord
    slack
    syncthing
    vlc
    yt-dlp
    zoom-us
    nb

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

    foliate # epub reader

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
    eslint_d

    # compression
    p7zip
    unzip
    xz
    zip
  ]);

  programs.neovim-flake = {
    background = "dark";
  };

  programs.git = {
    enable = true;
    userName = "Andrew Zah";
    userEmail = "zah@andrewzah.com";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    inherit shellAliases;

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
