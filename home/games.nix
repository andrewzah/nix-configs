{pkgs, ...}: {
  imports = [
    #./games/dwarf-fortress-classic.nix
  ];

  home.packages = with pkgs; [
    vbam # visualboyadvance-m
  ];
}
