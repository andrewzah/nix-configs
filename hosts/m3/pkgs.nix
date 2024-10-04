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

    #brews = [ ];

    extraConfig = ''
      cask_args appdir: "~/Applications"
    '';

    taps = [
      #"homebrew/cask-fonts"
      "homebrew/services"
      "koekeishiya/formulae"
    ];

    casks = [
      #"bitwarden"
      #"deluge"
      #"discord"
      #"docker"
      "firefox"
      #"mullvadvpn"
      #"slack"
      #"vlc"
      #"zoom"
    ];
  };
}
