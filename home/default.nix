{ config, pkgs, lib, ... }:

{
  home.username = "andrew";
  home.homeDirectory =
    if pkgs.system == "aarch64-darwin"
    then "/Users/andrew"
    else "/home/andrew";

  home.packages = with pkgs; [
    #hyprland
    #firefox
    #strace
    #ltrace
    #ethtool
    #lm_sensors
    #sysstat
    #usbutils

    awscli
    entr
    kubectl
    slack
    zoom-us

    p7zip
    unzip
    xz
    zip

    fzf
    jq
    lsd
    ripgrep

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
      k = "kubectl";
    };
  };

  home.sessionVariables.EDITOR = "nvim";
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.home-manager.enable = true;
  manual.manpages.enable = true;

  home.stateVersion = "23.11";
}