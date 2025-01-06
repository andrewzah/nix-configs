{pkgs, ...}: {
  home.packages = [
    (pkgs.callPackage ../pkgs/iosevka-consolas-ttf.nix {})
    #(pkgs.callPackage ../pkgs/iosevka-custom-ttf/default.nix {})

    pkgs.unifont

    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-cjk-serif
  ];
}
