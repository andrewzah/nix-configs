{pkgs, ...}: {
  services.printing.enable = true;
  services.printing.drivers = (with pkgs; [
    brlaser
    #brgenml1lpr
    #brgenml1cupswrapper
  ]);

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };
}
