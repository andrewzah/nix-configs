{pkgs, ...}: {
  imports = [
    ../../home/programs/git.nix
    ../../home/programs/alacritty.nix
    #../../home/programs/slippi.nix

    #../../home/games/dwarf-fortress-classic.nix
  ];

  home.packages = with pkgs; [
    mouseless # TODO: set up properly, move to services/module
    # TODO: needs a systemctl service definition + config + keyboard detection + hotkey
    # https://github.com/imsuck/dotfiles/blob/8f449aa1f8e1d60cd5653f33a12a239c1a6a57ad/dot_config/home-manager/mod/services.nix#L25

    pcmanfm

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

    ## image manipulation
    #darktable
    #rawtherapee
    krita

    #cockatrice
    steam
    steam-run
    mgba
    sameboy
    snes9x-gtk

    #ollama-rocm

    bruno
    sbomnix
    #sbom-utility
    #cyclonedx-cli
    #cyclonedx-gomod
    #cargo-cyclonedx
    #license-scanner
    #dep-scan
    #cdxgen # for dep-scan
    #bomber-go

    nix-output-monitor
    nh

    go-grip # markdown viewer
    binsider

    simplescreenrecorder
    tiled
    aseprite
  ];

  xdg.configFile."numbat/init.nbt".text =
    builtins.readFile ../../static-files/configs/numbat-init.nbt;

  xdg.configFile."mouseless/config.yaml".text =
    builtins.readFile ../../static-files/configs/mouseless.yaml;
}
