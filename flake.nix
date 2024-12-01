{
  description = "Andrew's General Flake";

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    nix-darwin,
    ...
  } @ inputs: {
    darwinConfigurations = {
      "Inspire-Others" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./hosts/m3/default.nix

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.andrew = {
              imports = [
                ./home/default.nix
                ./home/darwin-pkgs.nix
              ];
            };
          }
        ];
      };
    };
    darwinPackages = self.darwinConfigurations."Inspire-Others".pkgs;

    nixosConfigurations = let
      home-modules = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {inherit inputs;};
      };
    in {
      donbyeorak = let
        username = "dragon";
      in nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs username;};
        modules = [
          ./hosts/donbyeorak/default.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.users."${username}" = {
              imports = [
                ./home/default.nix
                ./home/x11.nix
                ./home/linux-pkgs.nix
              ];
            };
          }
          home-modules
        ];
      };

      xps9300 = let
        username = "andrew";
      in nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs username;};
        modules = [
          ./hosts/xps9300/default.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.users."${username}" = {
              imports = [
                ./home/default.nix
                ./home/wayland.nix
                ./home/linux-pkgs.nix
              ];
            };
          }
          home-modules
          nixos-hardware.nixosModules.dell-xps-13-9360
        ];
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    neovim-flake.url = "github:andrewzah/neovim-flake";
  };
}
