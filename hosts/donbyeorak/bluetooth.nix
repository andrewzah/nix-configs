{pkgs, ...}:
{
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    package = pkgs.bluez5-experimental;
    settings.General = {
      ControllerMode = "dual";
    };
  };
}
