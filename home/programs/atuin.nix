{...}: {
  programs.atuin = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = {
      sync_address = "https://atuin.lumiere.wtf";
      key_path = "~/.config/atuin/atuin_key.txt";
      auto_sync = true;
      filter_mode = "global";
      dialect = "us";
      enter_accept = false;
      sync.records = true;
    };
  };
}
