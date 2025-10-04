{...}: {
  imports = [
    ./dunst.nix
    ./i3.nix
    ./i3status-rust.nix
    ./x11.nix

    ./niri.nix
    ./wayland.nix
  ];
}
