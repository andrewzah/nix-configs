{
  config,
  pkgs,
  ...
}: {
  services.sketchybar.enable = false;

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
      "deluge"
      "discord"
      "docker"
      "firefox"
      "mullvadvpn"
      "slack"
      "vlc"
      "zoom"
    ];
  };
}
