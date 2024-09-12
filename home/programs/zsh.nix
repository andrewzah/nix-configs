{...}: let
  shellAliases = (import ../shell-aliases.nix {}).aliases;
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    inherit shellAliases;

    initExtra = ''
      set -o emacs

      #PROMPT=" (%?) [%n@%m:%2/] λ "
      export PROMPT="%F{cyan} %3~ %F{#FFFFFF}λ "

      # foot doesn't consider these valid by default
      bindkey "\e[27;2;13~" accept-line  # shift+return
      bindkey "\e[27;5;13~" accept-line  # ctrl+return

      function preexec {
        # foot: set window title from current cmd
        print -Pn "\e]0;''${(q)1}\e\\"

        # foot: pipe-command-output
        print -Pn "\e]133;C\e\\"
      }

      precmd() {
        # foot: jump between prompts
        print -Pn "\e]133;A\e\\"

        # foot: pipe-command-output
        print -Pn "\e]133;D\e\\"
      }
    '';
  };
}
