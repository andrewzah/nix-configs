{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.exactaudiocopy

    # which one to keep? picard has an ez but limited GUI
    pkgs.picard
    pkgs.beets
  ];

  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp.override {
      visualizerSupport = true;
      clockSupport = true;
      taglibSupport = true;
    };
    mpdMusicDir = "${config.home.homeDirectory}/music";

    # https://github.com/ncmpcpp/ncmpcpp/blob/master/doc/config
    settings = {
      mpd_host = "127.0.0.1";
      mpd_port = "6600";

      startup_screen = "visualizer";
      ncmpcpp_directory = "${config.home.homeDirectory}/.config/ncmpcpp";

      ignore_leading_the = false;
      external_editor = "nvim";
      message_delay_time = 1;
      playlist_disable_highlight_delay = 2;
      autocenter_mode = "yes";
      centered_cursor = "yes";
      allow_for_physical_item_deletion = "yes";
      lines_scrolled = "0";
      follow_now_playing_lyrics = "no";

      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "mpd_visualizer";
      visualizer_type = "spectrum";
      visualizer_look = "●●";
      visualizer_color = "blue, green";

      colors_enabled = "yes";
      playlist_display_mode = "classic";
      user_interface = "classic";
      volume_color = "white";

      song_window_title_format = "Music";
      statusbar_visibility = "yes";
      header_visibility = "no";
      titles_visibility = "no";
      # progress bar
      progressbar_look = "━━━";
      progressbar_color = "black";
      progressbar_elapsed_color = "blue";

      song_status_format = "$7%t";
      song_list_format = "$(008)%t$R  $(247)%a$R$5  %l$8";
      song_columns_list_format = "(53)[blue]{tr} (45)[blue]{a}";

      current_item_prefix = "$b$2| ";
      current_item_suffix = "$/b$5";

      now_playing_prefix = "$b$5| ";
      now_playing_suffix = "$/b$5";

      song_library_format = "{{%a - %t} (%b)}|{%f}";

      main_window_color = "blue";

      current_item_inactive_column_prefix = "$b$5";
      current_item_inactive_column_suffix = "$/b$5";

      color1 = "white";
      color2 = "blue";
    };
    bindings = [
      { key = "9"; command = "show_clock"; }
      { key = "f"; command = "seek_forward"; }
      { key = "F"; command = "seek_backward"; }
      { key = "n"; command = "next_found_item"; }
      { key = "N"; command = "previous_found_item"; }
      { key = "g"; command = "move_home"; }
      { key = "G"; command = "move_end"; }
      { key = "space"; command = "jump_to_playing_song"; }
    ];
  };

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
