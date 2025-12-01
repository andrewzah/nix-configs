{
  pkgs,
  nix-flatpak,
  ...
}: {
  imports = [
    ../common.nix
    ../common-linux.nix
    ../extraHosts.nix

    ../../services/bluetooth.nix
    ../../services/fcitx.nix
    ../../services/gpg.nix
    ../../services/keyd.nix
    ../../services/opensnitch.nix
    ../../services/redshift.nix
    ../../services/syncthing.nix

    ./hardware-configuration.nix
    ./services.nix
    ./unfree.nix
    ./remotebuilds.nix
    ./suspend-resume-fix.nix
  ];

  networking.hostName = "dende";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [
    4747
    4748
    8384
    22000 #syncthing
  ];
  networking.firewall.allowedUDPPorts = [
    22000
    21027 # syncthing
  ];

  time.timeZone = "Asia/Seoul";
  location.provider = "manual";

  # not where I actually live ;)
  location.latitude = 37.560012;
  location.longitude = 126.921768;

  programs.zsh.enable = true;
  programs.zsh.shellAliases = {
    switch = "nh os switch /home/dragon/nix#nixosConfigurations.dende";
  };

  boot.initrd.kernelModules = ["amdgpu"];
  ## required for the modern amdgpu and qualcomm WCN785x drivers
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_17;

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
    extraGroups = ["networkmanager" "wheel"];
    packages = [];
  };

  environment.systemPackages = [
    pkgs.vim
    pkgs.steam-run
  ];
  #++ (pkgs.callPackage ../../pkgs/andrew-zah-scripts.nix {});

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  programs.niri.enable = true;

  virtualisation = {
    docker.enable = true;
    containerd.enable = true;
  };

  # for dotnet programs
  programs.nix-ld.enable = true;

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  system.stateVersion = "24.11";
}
