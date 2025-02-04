{pkgs, ...}: {
  imports = [
    ../../home/programs/git.nix
    ../../home/programs/alacritty.nix

    ../../home/games/dwarf-fortress-classic.nix
  ];

  home.packages = (with pkgs; [
    obsidian
    scrot
    wthrr

    ## testing
    darktable
    rawtherapee

    steam
  ]);
}
