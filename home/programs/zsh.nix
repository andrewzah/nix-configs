{pkgs, ...}: let
  shellAliases = (import ../shell-aliases.nix {}).aliases;
in {
  home.packages = [
    pkgs.meslo-lgs-nf
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    inherit shellAliases;

    initContent = ''
      set -o emacs

      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ~/.config/p10k/p10k.zsh
    '';
  };

  xdg.configFile."p10k/p10k.zsh".text =
    builtins.readFile ../../static-files/configs/p10k.zsh;
}
