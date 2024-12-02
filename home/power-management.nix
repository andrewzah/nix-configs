{pkgs,...}: {
  home.packages = (with pkgs; [
    acpi
    tlp
    powertop
  ]);
}
