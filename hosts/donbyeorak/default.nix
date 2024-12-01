{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../common.nix
    ../common-linux.nix

    ./i18n.nix
    ./hardware-configuration.nix
    ./services.nix
    ./unfree.nix
    ./bluetooth.nix
  ];
  networking.hostName = "donbyeorak";
  time.timeZone = "America/New_York";
  users.users.dragon.extraGroups = ["docker" "input"];
  system.stateVersion = "24.05";

  services.sshd.enable = true;

  #hardware.bluetooth = {
  #  enable = true;
  #  powerOnBoot = true;
  #  package = pkgs.bluez5-experimental;
  #  settings.General = {
  #    ControllerMode = "dual";
  #  };
  #};

  programs.zsh.enable = true;
  programs.zsh.shellAliases = {
    switch = "sudo nixos-rebuild switch --flake /home/dragon/nix#donbyeorak";
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
    #docker.autoPrune.enable = true;

    containerd.enable = true;
  };
}
