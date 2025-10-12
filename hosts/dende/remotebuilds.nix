{...}: {
  nix.distributedBuilds = true;
  nix.extraOptions = ''
    builders-use-substitutes = true
  '';

  nix.buildMachines = [
    # {
    #   hostName = "eu.nixbuild.net";
    #   system = "aarch64-linux";
    #   maxJobs = 100;
    #   supportedFeatures = ["benchmark" "big-parallel"];
    # }
    {
      sshUser = "nixbuild";
      sshKey = "/home/dragon/.ssh/nixbld";
      hostName = "ehonda";
      system = "aarch64-linux";
      maxJobs = 100;
      #supportedFeatures = ["benchmark" "big-parallel"];
    }
  ];
}
