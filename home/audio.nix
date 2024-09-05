{pkgs, ...}: {
  imports = [
    ./programs/ncmpcpp.nix

    ./services/mpd.nix
    ./services/mpd-discord-rpc.nix
  ];

  home.packages = [
    pkgs.exactaudiocopy

    # which one to keep? picard has an ez but limited GUI
    pkgs.picard
    pkgs.beets
  ];
}
