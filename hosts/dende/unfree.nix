{lib, ...}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-run"
      "steam-unwrapped"

      "discord"
      "obsidian"

      "dwarf-fortress"
      "tergel-theme"

      "unrar"
      "snes9x-gtk"
    ];
}
