{ config, pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfree = lib.mkDefault true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = lib.mkDefault "America/New_York";

  environment.variables.EDITOR = "nvim";
  environment.systemPackages = with pkgs; [
    git
    fzf
    nix-index
    zsh
  ];

  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      set -o emacs
    '';
  };
}
