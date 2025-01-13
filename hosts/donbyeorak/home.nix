{pkgs, ...}: {
  imports = [
    ../../home/programs/git.nix
    ../../home/programs/alacritty.nix
    ../../home/programs/slippi.nix
  ];

  home.packages = (with pkgs; [
    dolphin-emu

    obsidian
    scrot
    wthrr

    dualsensectl
    xivlauncher
  ]);
}
