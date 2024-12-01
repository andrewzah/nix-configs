{pkgs, ...}: {
  imports = [
    #./games/dwarf-fortress-classic.nix
  ];

  home.packages = (with pkgs; [
    steam
    steam-run
    vbam # visualboyadvance-m
  ]);
}
