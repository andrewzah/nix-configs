{...}: {
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.openssh.enable = true;

  services.xserver = {
    enable = true;
    autorun = false;
    windowManager.i3.enable = true;

    videoDrivers = ["amd"];
  };
}
