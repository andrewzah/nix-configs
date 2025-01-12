{pkgs, ...}: {
  home.packages = [pkgs.rofi-wayland];

  xdg.configFile."rofi/config.rasi".text =
    builtins.readFile ../../static-files/configs/rofi/config.rasi;

  xdg.configFile."rofi/android_notification.rasi".text =
    builtins.readFile ../../static-files/configs/rofi/android_notification_theme.rasi;
}
