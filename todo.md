- refactor repo
  - particularly with nix/darwin conditional logic
  - and packages being split over various files
- set up personal & work logfiles w/ syncthing: (ln -s ?)
- figure out more about term title updates
  - right now, I use zsh's preexec() to show the last run command,
    otherwise there are no updates. however, when I run
    `nix-shell -p foot.terminfo`,
    it shows the cwd (but not the last run command)
  - the current situation is adequate.
- figure out fcitx5 env var home location
  - https://github.com/Vanderscycle/dotFiles/blob/7f0a070c887bea3a7b77cee6f3db9645617100b1/nixos-flakes/users/henri/services/fcitx.nix#L18
