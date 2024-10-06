{...}: {
  nix.buildMachines = [
    {
      hostName = "remotebuild@inspire-others";
      system = "aarch64-darwin";
      protocol = "ssh-ng";
    }
  ];
  nix.distributedBuilds = true;
  nix.extraOptions = ''
    builders-use-substitutes = true
  '';
}
