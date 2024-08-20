{  pkgs, ... }:
{
  home.packages = [
    pkgs.libre-baskerville
    (pkgs.callPackage ../packages/iosevka-consolas-ttf.nix {})
  ];
}
