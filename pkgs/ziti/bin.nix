{
  pkgs,
  stdenv,
  fetchzip,
  autoPatchelfHook,
  unzip,
  zlib,
  ...
}:
stdenv.mkDerivation rec {
  pname = "openziti-tools";
  version = "1.5.4";

  srcBinZiti = builtins.fetchTarball {
    url = "https://github.com/openziti/ziti/releases/download/v${version}/ziti-linux-amd64-${version}.tar.gz";
    sha256 = "sha256:0s0lbh7cd0c4hmdiaa6cmlddri2ggx020wv3d2b34yazz2jflzfn";
  };

  srcBinZitiEdgeTunnel = fetchzip rec {
    version = "1.6.1";
    url = "https://github.com/openziti/ziti-tunnel-sdk-c/releases/download/v${version}/ziti-edge-tunnel-Linux_x86_64.zip";
    hash = "sha256-YLin/8zCZs3rbPvfsa8UxFFvduXIaG4OufS+ybtro1Y=";
  };

  src = srcBinZiti;
  nativeBuildInputs = [
    autoPatchelfHook
    unzip
    zlib
  ];

  installPhase = ''
    install -m755 -d $out/bin/
    install -m755 -D ./ziti $out/bin/
    install -m755 -D $srcBinZitiEdgeTunnel/ziti-edge-tunnel $out/bin/
  '';
}
