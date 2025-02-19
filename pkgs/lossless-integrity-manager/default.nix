{ stdenv, lib, libgcc, libz, gcc, icu, fetchurl, autoPatchelfHook }: # inputs

# defines the package (derivation)
stdenv.mkDerivation rec {
  pname = "input-integrity-manager";
  version = "2024-01-24";
  phases = ["installPhase" "buildPhase"];

  # source files
  # this file needs to match the hash, otherwise the build will fail
  #src = fetchurl {
  #  url = "https://drive.google.com/file/d/1WwRvPNgeafW2MwGbrG1QZ0jOuu_af8XT/view?usp=drive_link";
  #  hash = "sha256-6HodLitgkhDpSOuA7InwtzfnSVdgIXfBm081baYyuiQ=";
  #};
  src = ./LosslessAdapterManager2_Linux;

  # patch the binary to look in a different location for dynamically linked dependencies
  nativeBuildInputs = [ autoPatchelfHook ];

  # dependencies to patch with
  buildInputs = [ libgcc libz gcc stdenv.cc.cc.lib icu.dev ];

  # install package
  installPhase = ''
    runHook preInstall
    mkdir -pv $out/bin
    install -m755 -D $src $out/bin/input-integrity-manager
    runHook postInstall
  '';
}
