{
  stdenv,
  fetchurl,
  lib,
  pkgs,
  ...
}:
stdenv.mkDerivation rec {
  pname = "sf-symbols";
  version = "5.1";

  src = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Symbols-${version}.dmg";
    hash = "sha256-7HIOlAYpQHzyoMhW2Jtwq2Tor8ojs4mTHjUjfMKKMM4=";
  };
  unpackPhase = ''
    undmg $src
    ls
    7z x 'SF Symbols.pkg'
    7z x 'Payload~'
  '';
  buildInputs = [pkgs.p7zip pkgs.undmg];
  installPhase = ''
    mkdir -p $out/share/fonts
    mkdir -p $out/share/fonts/opentype
    mkdir -p $out/share/fonts/truetype
    find -name \*.otf -exec mv {} $out/share/fonts/opentype/ \;
    find -name \*.ttf -exec mv {} $out/share/fonts/truetype/ \;
  '';
  meta = with lib; {
    description = ''
      SF-symbols
    '';
    platforms = platforms.darwin;
  };
}
