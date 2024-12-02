{
  pkgs,
  ...
}: {
  imports = [
    ../common.nix
    ../common-linux.nix

    ../../services/fcitx.nix
    ../../services/bluetooth.nix
    ../../services/syncthing.nix

    ./hardware-configuration.nix
    ./services.nix
    ./unfree.nix
  ];
  networking.hostName = "donbyeorak";
  time.timeZone = "America/New_York";
  users.users.dragon.extraGroups = ["docker" "input"];
  system.stateVersion = "24.05";

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
