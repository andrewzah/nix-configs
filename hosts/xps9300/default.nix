{
  pkgs,
  username,
  ...
}: {
  imports = [
    ../common.nix
    ../common-linux.nix
    ./hardware-configuration.nix

    ../../services/bluetooth.nix
    ../../services/fcitx.nix
    ../../services/keyd.nix

    ./power.nix
    ./services.nix

    ./nix.nix
    ./remotebuild.nix
    #./wireguard-client.nix
    ./unfree.nix
  ];

  networking.hostName = "xps9300";
  time.timeZone = "America/New_York";
  users.users."${username}".extraGroups = ["docker" "input"];
  system.stateVersion = "24.05";

  # for work
  services.hydra = {
    enable = false;
    hydraURL = "http://localhost:33000";
    notificationSender = "hydra@localhost";
    buildMachinesFiles = [];
    useSubstitutes = true;
  };

  # ps5 increase polling rate - but does it work with bluetooth ?
  #services.udev.extraRules = lib.concatStrings [
  #  # increase polling rate to 1ms for ps5 dualsense
  #  ''
  #    ACTION=="bind", SUBSYSTEM=="hid", DRIVER=="sony", KERNEL=="*054C:0CE6*", ATTR{bt_poll_interval}="1"
  #  ''
  #];

  #fileSystems."/mnt/cd1" = {
  #  device = "/dev/sr0";
  #  fsType = "auto";
  #  options = [
  #    "ro"
  #    "user"
  #    "noauto"
  #    "unhide"
  #  ];
  #};

  security.pki.certificateFiles = [
    /home/${username}/work/platform/nix/local-proxy/pki/docker-registry.arpa.crt
    /home/${username}/work/platform/nix/local-proxy/pki/attic.arpa.crt
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      bibata-cursors
    ];
  };

  programs.zsh.enable = true;
  programs.zsh.shellAliases = {
    switch = "sudo nixos-rebuild switch --flake ~/nix#xps9300";
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
  #boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  # 'sg' for dvd drives w/ encrypted content
  #boot.kernelModules = ["sg"];

  #programs.neovim-flake = {
  #  enable = true;
  #  background = "light";
  #};
}
