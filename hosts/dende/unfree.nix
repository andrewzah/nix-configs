{lib, ...}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "aseprite"
      "claude-code"
      "discord"
      "discord-canary"
      "dwarf-fortress"
      "fmod"
      "obsidian"
      "snes9x-gtk"
      "steam"
      "steam-original"
      "steam-run"
      "steam-unwrapped"
      "tergel-theme"
      "texturepacker"
      "unity"
      "unrar"
    ];
}
