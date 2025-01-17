{pkgs, ...}: let
  discordWrapper = pkgs.writeShellScriptBin "discord" ''
    ${pkgs.discord}/bin/discord --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime --gtk-version=4
  '';
in {
  imports = [
    ./programs/sway.nix
    ./programs/rofi-wayland.nix
    #./hyprland.nix

    pkgs.foot
  ];

  home.packages =
    (with pkgs; [
      libinput-gestures
      mako
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
    XKB_DEFAULT_LAYOUT = "us";

    MOZ_ENABLE_WAYLAND = "1";
    MOZ_WEBRENDER = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "sway";

    GLFW_IM_MODULE = "ibus";
    GTK_IM_MODULE = "fcitx";
    IMSETTINGS_MODULE = "fcitx";
    INPUT_METHOD = "fcitx";
    QT_IM_MODULE = "fcitx";
    SDL_IM_MODULE = "fcitx";
    XMODIFIERS = "@im,fcitx";
  };

  xdg.configFile."foot/foot.ini".text = builtins.readFile ../static-files/configs/foot.ini;
  xdg.configFile."mako/config".text = builtins.readFile ../static-files/configs/mako.conf;
  xdg.configFile."libinput-gestures.conf".text = builtins.readFile ../static-files/configs/libinput-gestures.conf;
}
