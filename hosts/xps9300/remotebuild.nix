{...}: {
  nix.buildMachines = [
    {
      hostName = "eu.nixbuild.net";
      system = "aarch64-linux";
      maxJobs = 100;
      supportedFeatures = ["benchmark" "big-parallel"];
    }
    #{
    #  hostName = "remotebuild@inspire-others";
    #  system = "aarch64-darwin";
    #  protocol = "ssh-ng";
    #}
  ];
  nix.distributedBuilds = true;
  nix.extraOptions = ''
    builders-use-substitutes = true
  '';
}
