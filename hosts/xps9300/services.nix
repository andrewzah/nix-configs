{
  config,
  pkgs,
  ...
}: {
  services.sshd.enable = true;

  services = {
    blueman.enable = true;

    syncthing = {
      enable = true;
      dataDir = "/home/andrew/sync";
      configDir = "/home/andrew/sync/config";
      user = "andrew";
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

  systemd.services = {
    keyd = {
      enable = true;

      description = "keyd daemon";
      wantedBy = ["multi-user.target"];
      unitConfig = {
        After = "local-fs.target";
      };

      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.keyd}/bin/keyd";
        Restart = "always";
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
