## prio 1
- learn how to wrap nix programs
- adjust volume and brightness ctl %s
- change bar to top to prevent burn in, or remove it entirely

## prio 2
- add to git config ?: https://github.com/nobssoftware/nocommit/blob/master/pre-commit
- refactor repo
  - particularly with nix/darwin conditional logic
  - and packages being split over various files
- set up personal & work logfiles w/ syncthing: (ln -s ?)
  - really, refactor how different personal log files are created and opened

## low prio
- figure out more about term title updates
  - right now, I use zsh's preexec() to show the last run command,
    otherwise there are no updates. however, when I run
    `nix-shell -p foot.terminfo`,
    it shows the cwd (but not the last run command)
  - the current situation is adequate.
