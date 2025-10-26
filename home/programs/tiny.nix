{
  pkgs,
  config,
  ...
}: {
  home.packages = [pkgs.tiny];

  xdg.configFile."tiny/config.yml".text =
    builtins.readFile ../../static-files/configs/tiny-irc.yml;

  xdg.configFile."tiny/configa.yml".source =
    config.lib.file.mkOutOfStoreSymlink ../../static-files/configs/tiny-irc.yml;
}
