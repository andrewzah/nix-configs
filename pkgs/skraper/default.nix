{pkgs, lib, fetchurl, stdenv, makeWrapper, ...}: stdenv.mkDerivation (finalAttrs: {
  pname = "skraper";
  version = "1.1.1";

  src = fetchurl {
    url = "https://www.skraper.net/download/beta/Skraper-${finalAttrs.version}.7z";
    hash = "sha256-RMSS6RKRfvPG62MdDupUijCRWVQyrO99NV3w6+LVtu8=";
  };

  nativeBuildInputs = [ pkgs.p7zip makeWrapper ];
  unpackPhase = ''
    7z x $src
  '';

  buildInputs = (with pkgs; [
  ]);
  runtimeLibPath = lib.makeLibraryPath finalAttrs.buildInputs;

  installPhase = ''
    ls -la .

    mkdir $out/opt/skraper
    cp *.dll 


    cat howdy
  '';

  meta = {
    homepage = "https://www.skraper.net/";
    downloadPage = "https://www.skraper.net/download";
    #license = lib.licenses.unfree;
    provenance = [lib.sourceTypes.binaryNativeCode];
  };
})
