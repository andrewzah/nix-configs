{
  pkgs,
  lib,
  ...
}: let
  auto_rom_script = pkgs.writeScriptBin "auto_rom_script" ''
    curl "https://fightcade.download/fc2json.zip" --output "/home/$USER/.var/app/com.fightcade.Fightcade/data/fc2json.zip"
    cd "/home/$USER/.var/app/com.fightcade.Fightcade/data"
    ${lib.getExe pkgs.unzip} "/home/$USER/.var/app/com.fightcade.Fightcade/data/fc2json.zip"
  '';
in {
  imports = [
    ../../home/programs/git.nix
    #../../home/programs/alacritty.nix
    ../../home/programs/ghostty.nix
    #../../home/programs/slippi.nix
    ../../home/programs/rofi-wayland.nix

    #../../home/games/dwarf-fortress-classic.nix

    ../../services/darkman.nix
  ];

  home.packages = with pkgs;
    [
      unrar
      arandr
      thunderbird # calendar ...

      runelite
      prismlauncher

      discord

      opensnitch-ui

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
    ]
    ++ [
      auto_rom_script
    ];

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 20;
    gtk.enable = true;
    x11.enable = true;
  };

  xdg.configFile."numbat/init.nbt".text =
    builtins.readFile ../../static-files/configs/numbat-init.nbt;

  xdg.configFile."mouseless/config.yaml".text =
    builtins.readFile ../../static-files/configs/mouseless.yaml;

  zah-hm.graphics = {
    # x11.enable = true;
    # i3.enable = true;
    # i3status-rust.enable = true;
    wayland.enable = true;
    niri.enable = true;
  };
  zah-hm.programs.dunst.enable = true;
}
