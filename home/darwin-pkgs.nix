{
  pkgs,
  lib,
  ...
}: {
  xdg.configFile."sketchybar" = {
    source = ../static-files/configs/sketchybar;
    recursive = true;
  };

  home.packages = with pkgs; [
    colima
    skhd
    yabai
    sketchybar
    discord

    (callPackage ../packages/sf_symbols.nix {})
    (callPackage ../packages/sketchybar-app-font.nix {})
  ];

  programs.zsh = {
    shellAliases = {
      switch = "darwin-rebuild switch --flake ~/nix-configs";
    };

    initContent = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
  };

  xdg.configFile."yabai/yabairc".text = builtins.readFile ../static-files/configs/yabairc;
  xdg.configFile."skhd/skhdrc".text = builtins.readFile ../static-files/configs/skhdrc;
}
