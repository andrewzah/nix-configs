{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./services.nix

    ../../services/keyd.nix
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = ["amdgpu"];
  # required for the modern amdgpu and qualcomm WCN785x drivers
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_12;

  networking.hostName = "dende";
  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";
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
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [pkgs.vim];

  #hardware.graphics.enable32Bit = true;

  system.stateVersion = "24.11";
}
