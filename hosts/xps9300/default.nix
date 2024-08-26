{
  pkgs,
  stateVersion,
  ...
}: {
  imports = [
    ../common.nix
    ../common-linux.nix
    ./hardware-configuration.nix
    ./services.nix
    ./i18n.nix
    ./unfree.nix
  ];
  networking.hostName = "xps9300";
  time.timeZone = "Asia/Seoul";
  users.users.andrew.extraGroups = ["docker" "input"];
  system.stateVersion = stateVersion;

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
    package = pkgs.bluez;
    settings.General = {
      ControllerMode = "dual";
    };
  };

  programs.zsh.shellAliases = {
    switch = "sudo nixos-rebuild switch --flake /etc/nixos#xps9300";
  };

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  programs.hyprland.enable = true;
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiIntel
    ];
  };

  virtualisation = {
    docker.enable = true;
    docker.autoPrune.enable = true;

    containerd.enable = true;
  };

  #programs.neovim-flake = {
  #  enable = true;
  #  background = "light";
  #};
}
