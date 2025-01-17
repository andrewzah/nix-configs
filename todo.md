## prio: high
- split out x11 config for donbyeorak & dende

## prio: low
- ssh: CLEARLY show in prompt when ssh'd into device
- reconfigure sshd to use pubkeys for homelab

## low prio
- refactor repo
  - particularly with nix/darwin conditional logic
- set up personal & work logfiles w/ syncthing: (ln -s ?)
  - really, refactor how different personal log files are created and opened
- https://github.com/NotAShelf/nyx/blob/main/modules/core/common/system/security/auditd.nix
- figure out more about term title updates
  - right now, I use zsh's preexec() to show the last run command,
    otherwise there are no updates. however, when I run
    `nix-shell -p foot.terminfo`,
    it shows the cwd (but not the last run command)
  - the current situation is adequate.
- https://github.com/sei40kr/dotfiles/blob/36916db5d20fb3899e6ac0a6378bb8d800474646/darwin/modules/homebrew.nix#L8

- ff:
  browser.tabs.insertAfterCurrent = true
