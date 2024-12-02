{pkgs, ...}: {
  imports = [
    ../../home/programs/alacritty.nix
  ];

  home.packages = (with pkgs; [
    scrot

    xivlauncher
    steam
    steam-run
  ]);
}
