{
  stdenv,
  lib,
  ...
}:
stdenv.mkDerivation {
  pname = "andrew-zah-scripts";
  version = "1.0";

  src = ../static-files/bin;
  installPhase = ''
    mkdir -p "$out/bin/"
    cp ./* "$out/bin/"
  '';
  meta = with lib; {
    description = ''
      andrew-zah-scripts
    '';
    platforms = platforms.x86_64;
  };
}
