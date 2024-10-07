{pkgs, ...}: let
  discordWrapper = pkgs.writeShellScriptBin "discord" ''
    ${pkgs.discord}/bin/discord --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime
  '';
in {
  imports = [
    ./programs/sway.nix

    #./hyprland.nix
  ];

  home.packages =
    (with pkgs; [
      libinput-gestures
      mako
      rofi-wayland
      swaylock
      wev

      grim
      slurp
      wl-clipboard
    ])
    ++ [
      discordWrapper
    ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    WLR_NO_HARDWARE_CURSORS = "1";
    XCURSOR_SIZE = "108";
    XKB_DEFAULT_LAYOUT = "en,us";
  };

  xdg.configFile."foot/foot.ini".text = builtins.readFile ../static-files/configs/foot.ini;
  xdg.configFile."mako/config".text = builtins.readFile ../static-files/configs/mako.conf;
  xdg.configFile."libinput-gestures.conf".text = builtins.readFile ../static-files/configs/libinput-gestures.conf;
}
