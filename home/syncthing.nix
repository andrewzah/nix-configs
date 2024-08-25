{pkgs, ...}: {
  # Wrap syncthing with various commands to keep its resource usage low.
  # only one core (https://docs.syncthing.net/users/faq.html#why-does-it-use-so-much-cpu)
  # minimum scheduling priority
  # "best effort" io scheduling with lowest priority
  systemd.user.services.syncthing.Service.ExecStart = pkgs.lib.mkForce (concatStringsSep " " [
    "${pkgs.coreutils}/bin/env GOMAXPROCS=1"
    "${pkgs.coreutils}/bin/nice --adjustment=19"
    "${pkgs.util-linux}/bin/ionice --class 2 --classdata 7"
    "${pkgs.syncthing}/bin/syncthing -no-browser -no-restart -logflags=0"
  ]);
}
