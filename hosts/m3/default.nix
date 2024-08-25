{
  pkgs,
  lib,
  stateVersion,
  ...
}: {
  imports = [
    ../common.nix
    ./pkgs.nix
  ];

  users.users.andrew = {
    home = "/Users/andrew";
    name = "andrew";
    shell = pkgs.zsh;
  };

  services.nix-daemon.enable = true;
  programs.zsh = {
    enable = true;
  };

  nix = {
    settings = {
      trusted-users = ["@admin" "andrew"];
    };
    linux-builder = {
      enable = true;
      package = pkgs.darwin.linux-builder;
    };
  };

  nixpkgs.config.allowUnfree = true;
  services.activate-system.enable = true;
  security.pam.enableSudoTouchIdAuth = true;

  time.timeZone = lib.mkOverride 50 "Asia/Tokyo";

  #system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
  system.stateVersion = stateVersion;
}
