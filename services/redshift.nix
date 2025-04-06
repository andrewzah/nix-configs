{...}: {
  # set location.latitude/longitude in ./hosts/<host>/default.nix
  services.redshift = {
    enable = true;

    temperature = {
      day = 5700;
      night = 3500;
    };
  };
}
