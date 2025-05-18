{pkgs, ...}: {
  imports = [
    ../../home/programs/git.nix
    ../../home/programs/alacritty.nix
    #../../home/programs/slippi.nix

    #../../home/games/dwarf-fortress-classic.nix
  ];

  home.packages = (with pkgs; [
    mouseless
    # https://github.com/imsuck/dotfiles/blob/8f449aa1f8e1d60cd5653f33a12a239c1a6a57ad/dot_config/home-manager/mod/services.nix#L25

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

  xdg.configFile."mouseless/config.yaml".text =
    builtins.readFile ../../static-files/configs/mouseless.yaml;
}
