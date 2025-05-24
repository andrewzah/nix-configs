{...}: {
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "";

  services.upower.enable = true;
  services.openssh.enable = true;

  services.xserver = {
    enable = true;
    autorun = false;
    windowManager.i3.enable = true;

    videoDrivers = ["amd"];
  };
}
