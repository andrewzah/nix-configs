{
  stdenv,
  fetchurl,
  lib,
  pkgs,
  ...
}:
stdenv.mkDerivation rec {
  pname = "iosevka-consolas-ttf";
  version = "30.0.1";

  src = fetchurl {
    url = "https://github.com/be5invis/Iosevka/releases/download/v${version}/PkgTTF-IosevkaSS03-${version}.zip";
    hash = "sha256-1XK7eFR+8CEqhtVbDt9wN1+oIA8CPhw7eWIxa6Oe764=";
  };
  unpackPhase = ''
    unzip $src
  '';
  buildInputs = with pkgs; [unzip];
  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    find -name \*.ttf -exec mv {} $out/share/fonts/truetype/ \;
  '';
  meta = with lib; {
    description = ''
      Iosevka SS03 (Consolas) TTF
    '';
    homepage = "https://github.com/be5invis/Iosevka";
    platforms = platforms.x86_64;
  };
}
