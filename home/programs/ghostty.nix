{...}: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    #themes = { my-theme = { palette = [];}; } # custom themes

    settings = {
      font-family = "Iosevka SS03";
      font-feature = "-calt, -liga, -dlig";
      font-size = 13;
      #theme = "dark:GitHub-Dark-High-Contrast,light:GitHub-Light-High-Contrast";
      theme = "GitHub-Dark-High-Contrast";

      window-decoration = false;
      copy-on-select = true;

      ## cursor
      cursor-style = "block";
      cursor-style-blink = "false";
      shell-integration-features = "no-cursor";
    };
  };
}
