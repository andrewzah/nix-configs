{lib, ...}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "unrar"
      "steam-original"
      "steam-run"
      "steam-unwrapped"

      "discord"
      "discord-canary"
      "obsidian"

      "dwarf-fortress"
      "tergel-theme"

      "unrar"
      "snes9x-gtk"

      "fmod"
      "texturepacker"
      "aseprite"
      "unity"
    ];
}
