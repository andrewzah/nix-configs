{ ...}: {
  services.xserver = {
    enable = true;
    autorun = false;
    windowManager.i3.enable = true;

    videoDrivers = ["nvidia"];
  };

  hardware.opengl.driSupport32Bit = true;
}
