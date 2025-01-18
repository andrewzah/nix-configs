{
  pkgs,
  lib,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  time.timeZone = lib.mkDefault "America/New_York";

  environment.variables.EDITOR = "nvim";
  environment.systemPackages = with pkgs; [
    vim
    git
    fzf
    zsh
  ];
}
