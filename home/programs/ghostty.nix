{...}: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    #themes = { my-theme = { palette = [];}; } # custom themes

    settings = {
      keybind = [
        "clear"
        "ctrl+equal=increase_font_size:1"
        "ctrl+plus=increase_font_size:1"
        "ctrl+minus=decrease_font_size:1"
        "ctrl+zero=reset_font_size"
        "ctrl+shift+i=inspector:toggle"
        "ctrl+shift+a=select_all"
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"
        "ctrl+comma=open_config"
      ];

      font-family = "Iosevka SS03";
      font-feature = "-calt, -liga, -dlig";
      font-size = 13;
      theme = "dark:GruvboxDarkHard,light:GruvboxLightHard";
      gtk-adwaita = true;

      window-decoration = "none";
      copy-on-select = true;

      ## cursor
      cursor-style = "block";
      cursor-style-blink = "false";
      shell-integration-features = "no-cursor";
    };
  };
}
# ghostty +list-themes
# dark: banana-blueberry, belafonte-night, carbonfox, citruszest, cyberpunkscarletprotocol, deep, earthsong, github-dark-gray, glacier, grape
# light: dayfox, farmhouse-light, github-light-high-contrast, gruvbox-light-hard

