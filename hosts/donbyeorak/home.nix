{pkgs, ...}: {
  imports = [
    ../../home/programs/git.nix
    ../../home/programs/alacritty.nix

    ../../home/programs/slippi.nix
    ../../home/games/dwarf-fortress-classic.nix
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
