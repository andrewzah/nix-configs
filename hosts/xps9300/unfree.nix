{lib, ...}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
      "discord-ptb"
      "dwarf-fortress"
      "exact-audio-copy"
      "makemkv"
      "obsidian"
      "slack"
      "webstorm"
      "vscode"
      "vscode-with-extensions"
      "vscode-extension-ms-vscode-remote-remote-containers"
      "vscode-extension-ms-vscode-remote-remote-ssh-edit"
      "vscode-extension-ms-vsliveshare-vsliveshare"
      "zoom"
    ];
}
