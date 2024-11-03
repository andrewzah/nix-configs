{pkgs, ...}: let
  vscode = pkgs.vscode-with-extensions.override {
    vscodeExtensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      christian-kohler.path-intellisense
      esbenp.prettier-vscode
      golang.go
      jdinhlife.gruvbox
      ms-azuretools.vscode-docker
      ms-python.python
      ms-vscode-remote.remote-containers
      ms-vscode-remote.remote-ssh-edit
      ms-vsliveshare.vsliveshare
      redhat.ansible
      redhat.vscode-yaml
      vscodevim.vim
    ];
  };
in {
  home.packages = [
    vscode
    pkgs.gopls
    pkgs.gotools
  ];
}
