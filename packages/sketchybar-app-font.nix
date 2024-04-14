{ stdenv, fetchurl, lib }:

stdenv.mkDerivation rec {
  pname = "sketchybar-app-font";
  version = "2.0.17";

  src = fetchurl {
    url = "https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v${version}/sketchybar-app-font.ttf";
    hash = "sha256-iVSWFqhzf0ZxfQODAf+uvGIiWMjWbir6ZWurlx3n6/w=";
  };

  buildCommand = ''
    install -m444 -Dt $out/share/fonts/truetype ${src}
  '';

  meta = with lib; {
    description = ''
      sketchybar-app-font
    '';
    homepage = "https://github.com/kvndrsslr/sketchybar-app-font";
    platforms = platforms.darwin;
  };
}
