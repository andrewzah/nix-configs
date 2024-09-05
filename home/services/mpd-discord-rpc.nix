{...}: {
  services.mpd-discord-rpc = {
    enable = true;
    settings = {
      format = {
        details = "$title";
        state = "$artist - $album";
        timestamp = "elapsed";
        large_image = "notes";
        small_image = "notes";
        large_text = "$album";
        small_text = "";
      };
    };
  };

  systemd.user.services = {
    mpd-discord-rpc = {
      Service = {
        Restart = "on-failure";
        RestartSec = "15s";
      };
    };
  };
}
