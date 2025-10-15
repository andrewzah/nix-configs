## look into

```nix
# look into: for getting the camera to autotrack
extraModulePackages = (with config.boot.kernelPacakges; [
    v4l2loopback.out
]);
extraModprobeConfig = ''
  options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
'';
kernelModules = ["v4l2loopback" "88x2bu"];
```

- [ ] fix discord IME not working under wayland
- look into: https://github.com/johannesjo/super-productivity
- review: https://github.com/jbensmann/mouseless
- look into:
  - https://wayland.freedesktop.org/libinput/doc/1.27.1/touchpad-jumping-cursors.html

- https://github.com/echasnovski/mini.nvim
- gtk settings:
  https://github.com/montchr/dotfield/blob/47c864c0135b51600f616099ff3eddf1576cf214/home/profiles/graphical/__gtk.nix

## prio: high

- https://github.com/crate-ci/typos
- split out x11 config for donbyeorak & dende
  - aka figure out _modules_

```nix
{
  services.openssh = {
    passwordAuthentication = false;
    allowSFTP = false; # Don't set this if you need sftp
    challengeResponseAuthentication = false;
    extraConfig = ''
      AllowTcpForwarding yes
      X11Forwarding no
      AllowAgentForwarding no
      AllowStreamLocalForwarding no
      AuthenticationMethods publickey
    '';
  };
}
```

## prio: low

- send notification upon screenshot key (or failure)
- reconfigure sshd to use pubkeys for homelab
- look into https://github.com/NotAShelf/Basix
- look into hyper key setup for all machines, for fcitx + my shortcuts in
  general

## low prio

- refactor repo
  - particularly with modules
- set up personal & work logfiles w/ syncthing: (ln -s ?)
  - really, refactor how different personal log files are created and opened
- https://github.com/NotAShelf/nyx/blob/main/modules/core/common/system/security/auditd.nix
- figure out more about term title updates
  - right now, I use zsh's preexec() to show the last run command, otherwise
    there are no updates. however, when I run `nix-shell -p foot.terminfo`, it
    shows the cwd (but not the last run command)
  - the current situation is adequate.
- https://github.com/sei40kr/dotfiles/blob/36916db5d20fb3899e6ac0a6378bb8d800474646/darwin/modules/homebrew.nix#L8
