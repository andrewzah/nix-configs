{...}: {
  services.mpd = {
    enable = true;
    musicDirectory = "/home/andrew/music";
    dataDir = "/home/andrew/.cache/mpd";
    network = {
      listenAddress = "127.0.0.1";
      port = 6600;
      startWhenNeeded = true;
    };
    extraConfig = ''
      follow_outside_symlinks "yes"
      auto_update "yes"
      audio_output {
        type "fifo"
        name "Visualizer"
        format "44100:16:2"
        path "/tmp/mpd.fifo"
      }
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
}
