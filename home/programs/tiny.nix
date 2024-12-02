{pkgs, ...}: {
  home.packages = [ pkgs.tiny ];

  xdg.configFile."tiny/config.yml".text =
    builtins.readFile ../../static-files/configs/tiny-irc.yml;
}
