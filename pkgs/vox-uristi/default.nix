{
  pkgs,
  lib,
  fetchFromGitHub,
  rustPlatform,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "vox-uristi";
  version = "0.15.1";

  useFetchCargoVendor = true;
  src = fetchFromGitHub {
    owner = "plule";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-udoQz0GNm8ueL6o7McPLj525R9FYoPa1nlsUDTl++Zw=";
  };
  cargoHash = "sha256-vPB+0ajWdGpgfqCaV889VU706BR3OKoMp0qMP51sGwU=";
  nativeBuildInputs = with pkgs; [cmake pkg-config];
  buildInputs = with pkgs; [openssl];

  meta = {
    description = "Export your Dwarf Fortress map in a voxel format to create beautiful 3D rendering of your fortresses.";
    homepage = "https://github.com/plule/vox-uristi";
    license = lib.licenses.gpl3Only;
  };
}
