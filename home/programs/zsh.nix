{...}: let
  shellAliases = (import ../shell-aliases.nix {}).aliases;
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    inherit shellAliases;

    initContent = ''
      set -o emacs

      if [[ -n "$SSH_CONNECTION" ]]; then
        userip=$(echo $SSH_CONNECTION | cut -d' ' -f1)
        ssh_conn_info="@$userip $USER@$(hostnamectl hostname)"
      fi

      #export PROMPT=" %F{cyan}$ssh_conn_info %3~ %F{#FFFFFF}λ "

      # foot doesn't consider these valid by default
      bindkey "\e[27;2;13~" accept-line  # shift+return
      bindkey "\e[27;5;13~" accept-line  # ctrl+return

      #function preexec {}
      #precmd() { }
    '';
  };
}
