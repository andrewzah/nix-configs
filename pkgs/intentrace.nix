{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "intentrace";
  version = "0.2.4";

  src = fetchFromGitHub {
    owner = "sectordistrict";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-Bsis8tL2xahJT/qAFVbbd/CZ7n8KJYLPTIl1a1WHR4c=";
  };

  cargoHash = "sha256-pyGcQy7p0+Vqv3Khy1hLgahcOpqnbKKmRLZcKwkvVWw=";

  meta = {
    description = "intentrace is strace with intent, it goes all the way for you instead of half the way.";
    homepage = "https://github.com/sectordistrict/intentrace";
    changelog = "https://github.com/sectordistrict/intentrace/releases/tag/v${version}";
    license = with lib.licenses; [ mit ];
    maintainers = with lib.maintainers; [ _414owen figsoda ];
    mainProgram = "macchina";
  };
}

