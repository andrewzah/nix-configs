{ extraPkgs, inputs, system, pkgs, ... }:
let
  sharedImports = [
    inputs.neovim-flake.homeManagerModules.${system}.default
    ({ home.packages = extraPkgs; })
  ];

  mkHyprlandHome = { hidpi ? true }:
    let
      imports = sharedImports;
      # ++ ../home/wayland.nix ...
    in
    (
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = pkgs.xargs { inherit hidpi; };
        modules = [
          { inherit imports; }
        ];
      }
    );
in
{
  hyprland-hdmi = mkHyprlandHome { hidpi = true; };
}
