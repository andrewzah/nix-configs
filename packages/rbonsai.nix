{
  lib,
  fetchFromGitHub,
  rustPlatform
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "rbonsai";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "roberte777";
    repo = finalAttrs.pname;
    rev = "v${finalAttrs.version}";
    hash = "sha256-W5j3uLNRC+RkNQFXEf27h2cLgyJtfqmwnbeFvcrH/z8=";
  };

  cargoHash = "sha256-goKiV3Gm8hxkJ9QqO1+A2Z7rvyetxGMEL6BQjiw/qNs=";

  prePatch = ''
    sed -i 's@rust-version = "1.80"@#rust-version = "1.80"@' ./Cargo.toml
  '';

  meta = {
    description = "A port of cbonsai (a bonsai tree generator) to Rust.";
    homepage = "https://github.com/roberte777/rbonsai";
    license = lib.licenses.gpl3Only;
  };
})
