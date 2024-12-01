{pkgs,...}: {
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
}
