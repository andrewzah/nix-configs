{...}: {
  # set location.latitude/longitude in ./hosts/<host>/default.nix
  services.redshift = {
    enable = true;

    temperature = {
      day = 5500;
      night = 3700;
    };
  };
}
