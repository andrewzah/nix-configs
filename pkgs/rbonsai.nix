{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "rbonsai";
  version = "0.1.5";

  src = fetchFromGitHub {
    owner = "roberte777";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-69MArXaMZLchKURM0koLACKWhm3NO+ZVoZsiHt9PkjQ=";
  };

  cargoHash = "sha256-78vOnu5RZgIR71x8fXbWmoeRDzRgaZBQXJ6nugLNij0=";

  #prePatch = ''
  #  sed -i 's@rust-version = "1.80"@#rust-version = "1.80"@' ./Cargo.toml
  #'';

  meta = {
    description = "A port of cbonsai (a bonsai tree generator) to Rust.";
    homepage = "https://github.com/roberte777/rbonsai";
    license = lib.licenses.gpl3Only;
  };
}
