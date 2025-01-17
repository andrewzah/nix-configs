{pkgs, ...}: {
  imports = [
    ../../home/programs/git.nix
    ../../home/programs/alacritty.nix
  ];

  home.packages = (with pkgs; [
    scrot
  ]);
}
