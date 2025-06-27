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
    darktable

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

    bruno
    sbom-utility
    sbomnix
    cyclonedx-cli
    cyclonedx-gomod
    cargo-cyclonedx
    license-scanner
    dep-scan
    cdxgen # for dep-scan
    bomber-go
    #(bomber-go.overrideAttrs (prev: rec {
    #  version = "0.5.1";
    #  src = fetchFromGitHub {
    #    owner = "devops-kung-fu";
    #    repo = "bomber";
    #    tag = "v${version}";
    #    hash = "sha256-D3xs8lVhrRKVVQYzHN7CQNw5NTC+AxgsWvJxnV0lwGY=";
    #  };
    #  vendorHash = "sha256-mhGnuNuvMvX4WsqnS7QkWcrPfWEyaQsSKDUOpg9YrO8=";

    #  doCheck = false;
    #}))

    nix-output-monitor
    nh
  ];

  xdg.configFile."numbat/init.nbt".text =
    builtins.readFile ../../static-files/configs/numbat-init.nbt;

  xdg.configFile."mouseless/config.yaml".text =
    builtins.readFile ../../static-files/configs/mouseless.yaml;
}
