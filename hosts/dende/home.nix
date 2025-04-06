{pkgs, ...}: {
  imports = [
    ../../home/programs/git.nix
    ../../home/programs/alacritty.nix
    #../../home/programs/slippi.nix

    #../../home/games/dwarf-fortress-classic.nix
  ];

  home.packages = (with pkgs; [
    btop-rocm

    obsidian
    scrot
    wthrr

    numbat # calc + unit conversions
    hyperfine # cli benchmarking
    #hexyl # hex viewer
    #rainfrog # nicer postgres cli
    rustscan
    #httpstat
    lnav

    ## testing
    #darktable
    #rawtherapee

    cockatrice
    steam
    steam-run

    ollama-rocm
  ]);
}
