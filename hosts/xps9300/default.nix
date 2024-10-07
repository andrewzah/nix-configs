{
  pkgs,
  lib,
  stateVersion,
  ...
}: {
  imports = [
    ../common.nix
    ../common-linux.nix
    ./hardware-configuration.nix
    ./i18n.nix
    ./power.nix
    ./services.nix
    ./unfree.nix

    #./remotebuild.nix
    #./wireguard-client.nix
  ];
  networking.hostName = "xps9300";
  time.timeZone = "Asia/Seoul";
  users.users.andrew.extraGroups = ["docker" "input"];
  system.stateVersion = stateVersion;

  services.udev.extraRules = lib.concatStrings [
    # increase polling rate to 1ms for ps5 dualsense
    ''
      ACTION=="bind", SUBSYSTEM=="hid", DRIVER=="sony", KERNEL=="*054C:0CE6*", ATTR{bt_poll_interval}="1"
    ''
  ];

  fileSystems."/mnt/cd1" = {
    device = "/dev/sr0";
    fsType = "auto";
    options = [
      "ro"
      "user"
      "noauto"
      "unhide"
    ];
  };

  security.pki.certificateFiles = [
    /home/andrew/work/0proxy/pki/docker-registry.arpa.crt
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    package = pkgs.bluez5-experimental;
    settings.General = {
      ControllerMode = "dual";
    };
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = (with pkgs; [
      bibata-cursors
    ]);
  };

  programs.zsh.enable = true;
  programs.zsh.shellAliases = {
    switch = "sudo nixos-rebuild switch --flake /etc/nixos#xps9300";
  };

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      (vaapiIntel.overrideAttrs (prev: {
        meta.priority = 1;
      }))
    ];
  };

  virtualisation = {
    docker.enable = true;
    docker.autoPrune.enable = true;

    containerd.enable = true;
  };
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  # 'sg' for dvd drives w/ encrypted content
  #boot.kernelModules = ["sg"];

  #programs.neovim-flake = {
  #  enable = true;
  #  background = "light";
  #};
}
