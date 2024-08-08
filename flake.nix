{
  description = "Andrew's NixOS & MacOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-hardware.url = "github:NixOS/nixos-hardware/master";

    # personal flake
    neovim-flake.url = "github:andrewzah/neovim-flake";

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    nix-darwin,
    neovim-flake,
    rust-overlay,
    ...
  } @ inputs: let
    username = "andrew";
    stateVersion = "24.05";

    home-modules = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = {inherit inputs username stateVersion;};
    };
  in {
    darwinConfigurations = {
      "Inspire-Others" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./hosts/m3/default.nix

          home-manager.darwinModules.home-manager
          {
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

    nixosConfigurations = {
      xps9300 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs stateVersion;};
        modules = [
          ./hosts/xps9300/default.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.users.andrew = {
              imports = [
                ./home/default.nix
                ./home/wayland.nix
                ./home/linux-pkgs.nix
              ];
            };
          }
          home-modules

          ({ pkgs, ... }: {
            nixpkgs.overlays = [ rust-overlay.overlays.default ];
            environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
          })

          nixos-hardware.nixosModules.dell-xps-13-9360
        ];
      };
    };
  };
}
