{pkgs, ...}: let
  zscreenLayout = pkgs.callPackage ../../static-files/bin/screenlayout.nix {};
in {
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "";

  services.gnome.gnome-keyring.enable = true;
  services.upower.enable = true;
  services.openssh.enable = true;

  services.udev.extraRules = pkgs.lib.concatStringsSep "\n" [
    ''
      ACTION=="change", SUBSYSTEM=="drm", ENV{HOTPLUG}=="1", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/dragon/.Xauthority", RUN+="${pkgs.lib.getExe zscreenLayout}"
    ''
    ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", ATTRS{idVendor}=="6f77", ATTRS{idProduct}=="0002", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    ''
  ];

  services.printing.enable = true;

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
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-termfilechooser
    ];
    config.common = {
      default = ["gtk"];
    };
    wlr.enable = true;
  };

  services.geoclue2 = {
    enable = true;
    staticLatitude = 37.560012;
    staticLongitude = 126.921768;
  };

  services.tailscale.enable = true;
  services.fwupd.enable = true;

  services.flatpak = {
    update.auto.enable = true;
    enable = true;
    packages = [
      "com.fightcade.Fightcade"
    ];
  };

  systemd.user.services.blueman-applet = {
    after = ["graphical-session.target"];
    partOf = ["graphical-session.target"];
  };

  systemd.user.services.waybar = {
    description = "Ghostty terminal daemon";

    after = ["graphical-session-pre.target" "niri.service"];
    partOf = ["graphical-session.target"];
    wantedBy = ["graphical-session.target"];

    serviceConfig = {
      Type = "exec";
      ExecStart = "${pkgs.lib.getExe pkgs.waybar} -c /home/dragon/.config/waybar/config";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };

  systemd.user.services.xdg-desktop-portal.after = ["graphical-session.target"];
  systemd.user.services.xdg-desktop-portal-gtk.after = ["graphical-session.target"];
}
