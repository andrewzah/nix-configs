{...}: {
  nix.distributedBuilds = true;
  nix.extraOptions = ''
    builders-use-substitutes = true
  '';

  nix.buildMachines = [
    {
      sshUser = "nixbuild";
      sshKey = "/home/dragon/.ssh/nixbld";
      hostName = "ehonda";
      system = "aarch64-linux";
      maxJobs = 100;
      supportedFeatures = [
        "nixos-test"
        "benchmark"
        "big-parallel"
      ];
      publicHostKey = "c3NoLXJzYSBBQUFBQjNOemFDMXljMkVBQUFBREFRQUJBQUFCZ1FEVFBJSVh0SDdubE5ldVNFSkZVTTFVbEIvTUpwbk5ZWGZNenBPWllvUGFWMnBFNnVmcE9vUnRmMVQ1Nkp0c0RBcFRlS2ZSNHoxU0Zibm1zYkRjZjlHRE1GN2VhUUx4c0hMSDhYQ0NXVjJGazJlbXpJRE90Q3dURU1tMWNqNjREVkd0MTRSUjhMZVVXbVpXSGY1a2JaczJHNjlBNVNhZ0RNZWl2UzRCUmUvMS9SY0t5Uk4rRDY0b1grM0hyckFVd0ZOaU9DdHU3K1IxRncxOGY3clVDS2NiZkxYWU5tWW93YlhVN3ltT0FPekZ3V2VlRlVzYlFIK29pTWo1WlVBUHdQVjFrbXQraWlGM0kvVUU2L2cyVmJoWGRvMWtaWGthMG5kSVhhTm9MaXEwZVRzR0tpZ3RZc0l6TmFodnVrcE9KRnZlZ1czWENqTDdtcG9QK1MzMmVxNGIrQ2xZUzRSa2kyTXZvYnhWdHZ4c2pxQ0Z2QTZOdW5va1pvSm5PTnMxT1BhYjJkcXFXVUp1eEhMQ0haMVdsait6dmFQRXB5Rjd4SGNzYklTTXZaNUZmT0ZiMU02TXgzbzlEc0FuSkc2bGdSbzM5S0FGNzZUWnRGLzlxVHY0dFBwQkxJS3hpZm5DcTZNWWlhcjZ0ZzJPK3kwSUR6MWlpcmpBem5FVGFTZHJSME09IAo=";
    }
    # {
    #   hostName = "eu.nixbuild.net";
    #   system = "aarch64-linux";
    #   maxJobs = 100;
    #   supportedFeatures = ["benchmark" "big-parallel"];
    # }
  ];
}
