{  lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "dwarf-fortress"
    "exactaudiocopy"
    "obsidian"
    "slack"
    "zoom"
  ];
}
