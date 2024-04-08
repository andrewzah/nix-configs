{
  description = "A Simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    nix-darwin,
    ...
  } @ inputs: {
    darwinConfigurations = {
      "m3" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./hosts/m3/default.nix

          home-manager.darwinModules.home-manager
          {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.andrew = import ./home;
          }
        ];
      };
    };
    darwinPackages = self.darwinConfigurations."m3".pkgs;

    nixosConfigurations = {
      xps9360 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/xps9360/default.nix

	  home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.andrew = import ./home;
	  }

          nixos-hardware.nixosModules.dell-xps-13-9360
        ];
      };
    };
  };
}
