{ pkgs, lib, ... }:
{
  xdg.configFile."sketchybar" = {
    source = ../static-files/sketchybar;
    recursive = true;
  };

  home.packages = with pkgs; [
    colima

    sketchybar
    (pkgs.callPackage ../packages/sf_symbols.nix {})
    (pkgs.callPackage ../packages/sketchybar-app-font.nix {})
  ];

  programs.zsh = {
    shellAliases = {
      switch = "darwin-rebuild switch --flake ~/nix-configs";
    };

    initExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
  };
}
