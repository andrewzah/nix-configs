{  lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "dwarf-fortress"
    "exact-audio-copy"
    "obsidian"
    "slack"
    "zoom"
  ];
}
