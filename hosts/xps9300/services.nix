{ username, ... }: {
  services.sshd.enable = true;
  services.tailscale.enable = true;

  services = {
  };

  environment.etc."keyd/default.conf".text = ''
    [ids]
    0001:0001

    [main]
    capslock = overload(control, esc)

    leftmeta = layer(alt)
    leftalt = layer(meta)
    rightalt = layer(meta)
  '';
}
