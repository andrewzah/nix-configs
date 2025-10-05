{pkgs, ...}: let
  zscreenLayout = pkgs.callPackage ../../static-files/bin/screenlayout.nix {};
in {
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "";

  services.upower.enable = true;
  services.openssh.enable = true;

  services.udev.extraRules = pkgs.lib.concatStringsSep "\n" [
    ''
      ACTION=="change", SUBSYSTEM=="drm", ENV{HOTPLUG}=="1", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/dragon/.Xauthority", RUN+="${pkgs.lib.getExe zscreenLayout}"
    ''
  ];

  services.xserver = {
    enable = true;
    videoDrivers = ["amd"];
  };
  programs.xwayland.enable = true;

  # services.xserver = {
  #   enable = true;
  #   autorun = false;
  #   windowManager.i3.enable = true;
  # };

  userExtraServices = {
    ghostty-daemon.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  services.geoclue2 = {
    enable = true;
    staticLatitude = 37.560012;
    staticLongitude = 126.921768;
  };

  services.tailscale.enable = true;

  services.flatpak = {
    update.auto.enable = true;
    enable = true;
    packages = [
      "com.fightcade.Fightcade"
    ];
  };
}
