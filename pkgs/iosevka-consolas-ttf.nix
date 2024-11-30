{
  stdenv,
  fetchurl,
  lib,
  pkgs,
  ...
}:
stdenv.mkDerivation rec {
  pname = "iosevka-consolas-ttf";
  version = "32.1.0";

  src = fetchurl {
    url = "https://github.com/be5invis/Iosevka/releases/download/v${version}/PkgTTF-IosevkaSS03-${version}.zip";
    hash = "sha256-ryNx3q3oCNbsBB610Ad6asK4c+dwP2y//1aDu0R1WNA=";
  };

  unpackPhase = ''
    unzip $src
  '';

  nativeBuildInputs = [pkgs.unzip];
  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    find -name \*.ttf -exec mv {} $out/share/fonts/truetype/ \;
  '';

  meta = {
    description = "Iosevka SS03 (Consolas) TTF";
    homepage = "https://github.com/be5invis/Iosevka";
    license = lib.licenses.ofl;
  };
}
