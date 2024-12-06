{pkgs, lib, stdenv, fetchzip, autoPatchelfHook, ...}:
stdenv.mkDerivation rec {
  name = "optcgsim";
  version = "1.25c";

  src = fetchzip {
    url = "https://s3.us-east-1.amazonaws.com/com.andrewzah.files/tmp/optcgsim-${version}-linux.zip";
    extension = "zip";
    hash = "sha256-6gYTVLwwMcIg9DawMOmk4AcHnOIoUpKNuMtFeK3qFt0=";
  };

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = (with pkgs; [
    stdenv.cc.cc.lib
    glibc
    gtk3 gtk3-x11 glib libGL
    vulkan-loader
  ]);

  installPhase = ''
    mkdir -p $out/bin

    cp -R $src/* $out

    chmod +x $out/OPTCGSim.x86_64
    ln -s $out/OPTCGSim.x86_64 $out/bin/OPTCGSim.x86_64
  '';
  #meta.license = lib.licenses.unfree;
}
