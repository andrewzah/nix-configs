{ username, ... }: {
  services.sshd.enable = true;
  services.tailscale.enable = true;

  services = {
    syncthing = {
      enable = true;
      dataDir = "/home/${username}/sync";
      configDir = "/home/${username}/sync/config";
      user = "${username}";
      group = "users";
      overrideFolders = false;
      overrideDevices = false;
      settings = {
        options = {
          # don't submit anon usage data
          urAccepted = -1;
        };
        devices = {
          "eagle" = {id = "KBKNDRJ-2HCG7A4-OOR7NX6-APK3DUU-KKODEFE-GCFPD5S-SHLRNFJ-OFKIHQX";};
        };
      };
    };
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
