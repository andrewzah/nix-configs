{...}: {
  services.xserver = {
    enable = true;
    autorun = false;
    windowManager.i3.enable = true;

    videoDrivers = ["nvidia"];
  };
}
#services.sshd.enable = true;
#}

