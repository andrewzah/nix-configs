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

  discordWrapper = pkgs.writeShellScriptBin "discord" ''
    ${lib.getExe pkgs.discord-canary} --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime --gtk-version=4
  '';
in {
  imports = [
    ../../home/programs/git.nix
    ../../home/programs/ghostty.nix
    ../../services/darkman.nix
  ];

  home.packages = with pkgs;
    [
      minikube
      element-desktop
      xorg.libXcursor
      unrar
      arandr
      thunderbird # calendar ...

      losslesscut-bin # use w/ wf-recorder, simplescreenrecorder

      runelite
      prismlauncher

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

      #simplescreenrecorder doesn't work well on wayland
      tiled
      aseprite
      blender

      #godot
      godotPackages_4_5.godot
    ]
    ++ [
      auto_rom_script
      discordWrapper
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
    x11.enable = false;
    i3.enable = false;
    i3status-rust.enable = false;

    wayland.enable = true;
    waybar.enable = true;
    niri.enable = true;
  };
  zah-hm.programs.dunst.enable = true;

  services.blueman-applet.enable = true;
}
