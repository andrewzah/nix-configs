{ config, pkgs, ... }:
{
  #nix.settings.auto-optimize-store = true;

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
    brews = [
      "yabai"
      "skhd"
    ];
    extraConfig = ''
      cask_args appdir: "~/Applications"
    '';
    taps = [
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "homebrew/services"
      "koekeishiya/formulae"
    ];
    casks = [
      "bitwarden"
      "firefox"
      "slack"
      "zoom"
    ];
  };
}
