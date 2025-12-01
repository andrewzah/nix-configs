{pkgs, ...}: {
  programs.ghostty = {
    enable = true;

    # issue in 25.11, on boht kernel 6.12.x and 6.17.x
    package = pkgs.ghostty.overrideAttrs (_: {
      preBuild = ''
        shopt -s globstar
        sed -i 's/^const xev = @import("xev");$/const xev = @import("xev").Epoll;/' **/*.zig
        shopt -u globstar
      '';
    });
    enableZshIntegration = true;

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

      theme = "dark:Synthwave,light:GitHub Light Default";

      window-decoration = "none";
      copy-on-select = true;

      cursor-style = "block";
      cursor-style-blink = "true";
      shell-integration-features = "no-cursor";
    };
  };
}
# ghostty +list-themes
# dark: Tomorrow Night Burns, Synthwave, banana-blueberry, belafonte-night, carbonfox, citruszest, cyberpunkscarletprotocol, deep, earthsong, github-dark-gray, glacier, grape

