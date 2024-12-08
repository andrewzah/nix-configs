{pkgs, lib, stdenv, fetchzip, autoPatchelfHook, makeWrapper, ...}:
stdenv.mkDerivation rec {
  name = "optcgsim";
  version = "1.25c";

  src = fetchzip {
    url = "https://s3.us-east-1.amazonaws.com/com.andrewzah.files/tmp/optcgsim-${version}-linux.zip";
    hash = "sha256-6gYTVLwwMcIg9DawMOmk4AcHnOIoUpKNuMtFeK3qFt0=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];

  # deps for unity
  buildInputs = (with pkgs; [
    cairo
    clang
    cpio
    gdk-pixbuf
    glib
    gnome2.GConf
    gtk3
    gtk3-x11
    icu
    libGL
    libGLU
    libcap
    libglvnd
    libpulseaudio
    libva
    libxml2
    openssl
    pango
    udev
    wayland
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrender
    zlib
  ]);
  runtimeLibPath = lib.makeLibraryPath buildInputs;

  installPhase = ''
    mkdir -p \
      $out/bin \
      $out/data \
      $out/lib

    cp -r \
      $src/Decks \
      $src/OPTCGSim_Data \
      $out/data/

    ln -s $out/data/OPTCGSim_Data $out/bin/.OPTCGSim_Data

    cp $src/UnityPlayer.so $out/lib/UnityPlayer.so

    cp $src/OPTCGSim.x86_64 $out/bin/OPTCGSim.x86_64
    chmod +x $out/bin/OPTCGSim.x86_64
    wrapProgram "$out/bin/OPTCGSim.x86_64" --prefix LD_LIBRARY_PATH : ${runtimeLibPath}
  '';

  meta = {
    homepage = "https://linktr.ee/maebatsu";
    description = "One Piece TCG Simulator";
    longDescription = ''
      A simulator written in Unity for the One Piece
      Trading Card game.
    '';
    platforms = [ "x86_64-linux" ];

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    license = lib.licenses.unfree;
  };
}
