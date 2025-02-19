{
  description = "Andrew's General Flake";

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    nix-darwin,
    slippi,
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
      };
    in {
      donbyeorak = let
        username = "dragon";
      in nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs username;};
        modules = [
          ./hosts/donbyeorak/default.nix
          slippi.nixosModules.default

          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {inherit inputs username;};
            home-manager.users."${username}" = {
              imports = [
                ./hosts/donbyeorak/home.nix

                ./home/default.nix
                ./home/x11.nix

                slippi.homeManagerModules.default
              ];
            };
          }
          home-modules
        ];
      };

      ginyu = let
        username = "andrew";
      in nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs username;};
        modules = [
          ./hosts/xps9300/default.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {inherit inputs username;};
            home-manager.users."${username}" = {
              imports = [
                ./home/default.nix
                ./home/wayland.nix
              ];
            };
          }
          home-modules
          nixos-hardware.nixosModules.dell-xps-13-9360
        ];
      };

      dende = let
        username = "dragon";
      in nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs username;};
        modules = [
          ./hosts/dende/default.nix

          slippi.nixosModules.default {
            gamecube-controller-adapter.udev-rules.enable = true;
            gamecube-controller-adapter.overclocking-kernel-module.enable = true;
          }

          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {inherit inputs username;};
            home-manager.users."${username}" = {
              imports = [
                ./hosts/dende/home.nix
                ./home/default.nix
                ./home/x11.nix

                #./modules/x11.nix
                slippi.homeManagerModules.default
              ];
            };
          }
          home-modules
          nixos-hardware.nixosModules.lenovo-thinkpad-t14s
        ];
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    neovim-flake.url = "github:andrewzah/neovim-flake";
    slippi.url = "github:lytedev/slippi-nix";
    #slippi.url = "github:andrewzah/slippi-nix";
    #slippi.url = "git+file:///home/dragon/programming/slippi-nix";
  };
}
