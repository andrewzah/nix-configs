{
  description = "Andrew's General Flake";

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nixos-hardware,
    #nix-darwin,
    nix-flatpak,
    ...
  } @ inputs: {
    nixosConfigurations = let
      home-modules = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      };
    in {
      #   donbyeorak = let
      #     username = "dragon";
      #   in
      #     nixpkgs.lib.nixosSystem {
      #       system = "x86_64-linux";
      #       specialArgs = {inherit inputs username;};
      #       modules = [
      #         ./hosts/donbyeorak/default.nix
      #
      #         home-manager.nixosModules.home-manager
      #         {
      #           home-manager.extraSpecialArgs = {inherit inputs username;};
      #           home-manager.users."${username}" = {
      #             imports = [
      #               ./hosts/donbyeorak/home.nix
      #
      #               ./home/default.nix
      #               ./home/x11.nix
      #             ];
      #           };
      #         }
      #         home-modules
      #       ];
      #     };
      #
      #   ginyu = let
      #     username = "andrew";
      #   in
      #     nixpkgs.lib.nixosSystem {
      #       system = "x86_64-linux";
      #       specialArgs = {inherit inputs username;};
      #       modules = [
      #         ./hosts/xps9300/default.nix
      #
      #         home-manager.nixosModules.home-manager
      #         {
      #           home-manager.extraSpecialArgs = {inherit inputs username;};
      #           home-manager.users."${username}" = {
      #             imports = [
      #               ./home/default.nix
      #               ./home/wayland.nix
      #             ];
      #           };
      #         }
      #         home-modules
      #         nixos-hardware.nixosModules.dell-xps-13-9360
      #       ];
      #     };
      #
      dende = let
        username = "dragon";
      in
        nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {inherit inputs username;};
          modules = [
            "${nix-flatpak}/modules/nixos.nix"
            ./hosts/dende/default.nix
            ./modules

            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                inherit inputs username;
                pkgs-unstable = import nixpkgs-unstable {
                  inherit system;
                };
              };
              home-manager.users."${username}" = {
                imports = [
                  ./home
                  ./hosts/dende/home.nix
                  ./hm-modules
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
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-hardware.url = "github:NixOS/nixos-hardware/master";
    # nix-darwin.url = "github:LnL7/nix-darwin";
    # nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    neovim-flake.url = "github:andrewzah/neovim-flake";
    #neovim-flake.url = "git+file:///home/dragon/programming/neovim-flake";
  };
}
