{ config, pkgs, inputs, ... }:

{
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
  programs.zsh.enable = true;

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [ "@admin" "andrew" ];
    };
    linux-builder = {
      enable = true;
      package = pkgs.darwin.linux-builder;
    };
  };

  nixpkgs.config.allowUnfree = true;
  services.activate-system.enable = true;
  security.pam.enableSudoTouchIdAuth = true;

  #system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
  system.stateVersion = 4;
}
