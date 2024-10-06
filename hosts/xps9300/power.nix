{config, ...}:
#{ modulesPath, options, inputs, stateVersion, lib, specialArgs, config }:
{
  #services.thermald.enable = false;

  services.tlp = {
    enable = false;
    settings = {
      TLP_PERSISTENT_DEFAULT = 0;

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_HWP_ON_BAT = "balance_power";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_HWP_ON_AC = "balance_performance";
      CPU_SCALING_GOVERNOR_ON_AC = "performance";

      # wifi power saving mode
      WIFI_PWR_ON_AC = "off";
      WIFI_PWR_ON_BAT = "on";

      #CPU_MIN_PERF_ON_AC = 0;
      #CPU_MAX_PERF_ON_AC = 100;
      #CPU_MIN_PERF_ON_BAT = 0;
      #CPU_MAX_PERF_ON_BAT = 60;

      #Optional helps save long term battery health
      #on supported devices only, e.g. thinkpads
      #START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
      #STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
    };
  };

  #boot = {
  #  kernelModules = ["acpi_call"];
  #  extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  #};
}
