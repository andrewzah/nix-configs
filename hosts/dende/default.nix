{ pkgs, ... }:
{
  imports = [
    ../common.nix
    ../common-linux.nix

    ../../services/fcitx.nix
    ../../services/gpg.nix
    ../../services/keyd.nix
    ../../services/bluetooth.nix

    ./hardware-configuration.nix
    ./services.nix
    ./unfree.nix
  ];

  networking.hostName = "dende";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Seoul";

  programs.zsh.enable = true;
  programs.zsh.shellAliases = {
    switch = "sudo nixos-rebuild switch --flake /home/dragon/nix#dende";
  };

  boot.initrd.kernelModules = ["amdgpu"];
  ## required for the modern amdgpu and qualcomm WCN785x drivers
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_12;

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dragon = {
    isNormalUser = true;
    description = "dragon";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [];
  };

  environment.systemPackages = [pkgs.vim];

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  virtualisation = {
    docker.enable = true;
    containerd.enable = true;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    amdgpu.amdvlk = {
      enable = true;
      support32Bit.enable = true;
    };
};

  system.stateVersion = "24.11";
}
