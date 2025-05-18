{pkgs, ...}: {
  imports = [
    ../../home/programs/git.nix
    ../../home/programs/alacritty.nix
    #../../home/programs/slippi.nix

    #../../home/games/dwarf-fortress-classic.nix
  ];

  home.packages = (with pkgs; [
    mouseless

    unrar
    filezilla

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

    #cockatrice
    steam
    steam-run

    mgba
    sameboy
    snes9x-gtk

    #ollama-rocm
    sbom-utility
    sbomnix
    cyclonedx-cli
    cyclonedx-gomod
    cargo-cyclonedx
    license-scanner
  ]);

  xdg.configFile."numbat/init.nbt".text =
    builtins.readFile ../../static-files/configs/numbat-init.nbt;
}
