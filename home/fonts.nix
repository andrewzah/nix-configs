{pkgs, ...}: {
  home.packages = [
    (pkgs.callPackage ../packages/iosevka-consolas-ttf.nix {})

    pkgs.libre-baskerville
    pkgs.unifont

    pkgs.noto-fonts-cjk
  ];
}
