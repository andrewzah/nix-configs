{...}: {
  programs.firefox = {
    enable = true;

    profiles = {
      myuser = {
        id = 0;
        settings = {
          "media.ffmpeg.vaapi.enabled" = true;
          "media.ffvpx.enabled" = true;
          "media.av1.enabled" = true;
          "gfx.webrender.all" = true;
        };
      };
    };
  };
}
