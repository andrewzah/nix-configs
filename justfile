build:
  #!/bin/bash

  nix build --extra-experimental-features nix-command --extra-experimental-features flakes -- .#nixosConfigurations.xps9360
