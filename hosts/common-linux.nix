{
  pkgs,
  lib,
  username,
  ...
}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.variables = {
    XKB_DEFAULT_LAYOUT = "us";
  };

  networking = {
    networkmanager.enable = true;
    enableIPv6 = false;
    dhcpcd.wait = "background"; # don't wait on interfaces to boot
    dhcpcd.extraConfig = "noarp"; # avoid checking if IP is already taken, boot faster

    extraHosts = lib.concatStringsSep "\n" [
      "127.0.0.1 airflow.arpa"
      "127.0.0.1 apiman.arpa"
      "127.0.0.1 attic.arpa"
      "127.0.0.1 docker-registry.arpa"
      "127.0.0.1 jupyterhub.arpa"
      "127.0.0.1 keycloak.arpa"
      "127.0.0.1 nginx.arpa"
    ];
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    wireplumber.enable = true;
    pulse.enable = true;
    jack.enable = false;
  };

  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = ["docker" "networkmanager" "wheel"];
    shell = pkgs.zsh;
  };

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

  fonts.packages = with pkgs; [
    nanum
    noto-fonts
  ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
