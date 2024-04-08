{ config, pkgs, ... }:

{
  home.username = "andrew";
  home.homeDirectory = "/home/andrew";

  home.packages = with pkgs; [
    hyprland

    awscli
    entr
    firefox
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
    strace
    ltrace
    lsof

    ethtool
    lm_sensors
    pciutils
    sysstat
    usbutils
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

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    enable = true;
    "$mod" = "SUPER";
    bind =
      [
        "$mod, F, exec, firefox"
      ]
      ++ (
        builtins.concatLists (builtins.genList (
	  x: let
	    ws = let
	      c = (x + 1) / 10;
            in
	      builtins.toString (x + 1 - (c * 10));
          in [
	    "$mod, ${ws}, workspace, ${toString (x + 1)}"
	    "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
	  ]
	)
	10)
      );
  };

  home.sessionVariables.EDITOR = "nvim";
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
  manual.manpages.enable = true;
}
