{pkgs, ...}: {
  imports = [
    ../../home/programs/alacritty.nix
  ];

  home.packages = (with pkgs; [
    obsidian
    scrot

    xivlauncher
    steam
    steam-run
  ]);
}
