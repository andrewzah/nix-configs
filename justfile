b-xps:
  #!/usr/bin/env bash

  nix build --extra-experimental-features nix-command --extra-experimental-features flakes -- .#nixosConfigurations.xps9300

update-nvim:
  nix flake lock --update-input neovim-flake
