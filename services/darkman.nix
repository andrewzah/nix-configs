{
  pkgs,
  lib,
  ...
}: let
  home.packages = [
    pkgs.glib
    pkgs.dconf
    pkgs.xdg-desktop-portal-gtk
    pkgs.adwaita-qt
  ];

  switchGTK = pkgs.writeShellApplication {
    name = "darkman-switch-gtk";

    runtimeInputs = with pkgs; [dconf];

    text = ''
      mode="$1"

      ${lib.getExe pkgs.dconf} write \
        /org/gnome/desktop/interface/color-scheme \
        "'prefer-$mode'"
    '';
  };
in {
  services.darkman = {
    enable = true;

    settings = {
      lat = 37.560012;
      lng = 126.921768;
      usegeoclue = true;
      dbusserver = true;
    };

    lightModeScripts = {
      gtk = "${lib.getExe switchGTK} light";
    };

    darkModeScripts = {
      gtk = "${lib.getExe switchGTK} dark";
    };
  };
}
