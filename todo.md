#
## prio 1
- https://github.com/tomodachi94/dotfiles/blob/main/flake.nix
- learn how to wrap nix programs
- vim: bind :W to :w

## prio 2
- refactor repo
  - particularly with nix/darwin conditional logic
- set up personal & work logfiles w/ syncthing: (ln -s ?)
  - really, refactor how different personal log files are created and opened

## low prio
- https://github.com/NotAShelf/nyx/blob/main/modules/core/common/system/security/auditd.nix
- figure out more about term title updates
  - right now, I use zsh's preexec() to show the last run command,
    otherwise there are no updates. however, when I run
    `nix-shell -p foot.terminfo`,
    it shows the cwd (but not the last run command)
  - the current situation is adequate.
