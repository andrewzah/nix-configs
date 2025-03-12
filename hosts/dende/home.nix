{pkgs, ...}: {
  imports = [
    ../../home/programs/git.nix
    ../../home/programs/alacritty.nix
    #../../home/programs/slippi.nix

    ../../home/games/dwarf-fortress-classic.nix
  ];

  home.packages = (with pkgs; [
    btop-rocm

    obsidian
    scrot
    wthrr

    fend # arbitrary unit conversions

    ## testing
    #darktable
    #rawtherapee

    cockatrice
    steam
    steam-run

    ollama-rocm
  ]);
}
