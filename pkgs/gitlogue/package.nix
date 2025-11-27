{
  pkgs,
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "gitlogue";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "unhappychoice";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-IKCjv33I6bM5PSp1IBXEArHgNF1hV9J+Zko0uV2OPZA=";
  };

  cargoHash = "sha256-j8h+EI+vOf8nN69ROFiwuUBRi84T/QdhbdMpAMupkoM=";

  nativeBuildInputs = [pkgs.openssl pkgs.pkg-config pkgs.perl];

  meta = {
    description = "A cinematic Git commit replay tool for the terminal, turning your Git history into a living, animated story.";
    homepage = "https://github.com/unhappychoice/gitlogue";
    license = lib.licenses.isc;
    mainProgram = "gitlogue";
  };
}
