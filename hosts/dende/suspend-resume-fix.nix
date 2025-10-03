{...}: {
  # occasionally (lately frequently...), laptop becomes unresponsive
  # after suspending and resuming
  # this seems to be a bug with the ath11k/ath12k modules
  systemd.user.services = {
    ath12k-suspend = {
      enable = true;
      description = "suspend: rmmod ath12k_pci";
      before = ["sleep.target"];
      wantedBy = ["sleep.target"];

      serviceConfig = {
        Type = "oneshot";
        ExecStart = "rmmod ath12k";
      };
    };

    ath12k-resume = {
      enable = true;
      description = "resume: modprobe ath12k_pci";
      after = ["suspend-then-hibernate.target" "hibernate.target" "hybrid-sleep.target"];
      wantedBy = ["suspend-then-hibernate.target" "hibernate.target" "hybrid-sleep.target"];

      serviceConfig = {
        Type = "oneshot";
        ExecStart = "modprobe ath12k";
      };
    };
  };
}
