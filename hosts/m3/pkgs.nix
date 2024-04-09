{ config, pkgs, ... }:
{

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

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
