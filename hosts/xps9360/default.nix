{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../common.nix
      ../common-linux.nix
      ./hardware-configuration.nix
    ];

  programs.zsh.shellAliases = {
    switch = "sudo nixos-rebuild switch --flake /etc/nixos#xps9360";
  };

  programs.hyprland.enable = true;
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiIntel
    ];
  };

  systemd.services = {
    keyd = {
      enable = true;

      description = "keyd daemon";
      wantedBy = [ "multi-user.target" ];
      unitConfig = {
        After = "local-fs.target";
      };

      serviceConfig = {
        Type = "simple";
	ExecStart = "${pkgs.keyd}/bin/keyd";
	Restart = "always";
      };
    };
  };
  environment.etc."keyd/default.conf".text = ''
  [ids]
  *

  [main]
  capslock = overload(control, esc)
  esc = capslock
  '';


  virtualization.docker.enable = true;
  users.users.andrew.extraGroups = [ "docker" ];

  networking.hostName = "xps9360";
  system.stateVersion = "23.11";
}
