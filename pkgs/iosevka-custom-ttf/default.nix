{ iosevka, fetchFromGitHub }:
let
  customIosevka = (iosevka.override {
    privateBuildPlan = builtins.readFile ./private-build-plans.toml;
    set = "Custom";
  });
in
(customIosevka.overrideAttrs (orig: {
  version = "302.1.0";

  src = fetchFromGitHub {
    inherit (orig.src) owner repo;
    rev = "v302.1.0";
    hash = "sha256-bLB85rla5hN62EGOSVkW6FZM0+U2hkg50LMg2NsMXkU=";
  };

  installPhase = ''
    yoyoma
  '';

  npmDepsHash = "";
}))
