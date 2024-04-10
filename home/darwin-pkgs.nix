{ pkgs, ... }:
{
  xdg.configFile."sketchybar" = {
    source = ../static-files/sketchybar;
    recursive = true;
  };

  home.packages = with pkgs; [
    sketchybar
  ];
}
