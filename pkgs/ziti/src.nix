{
  pkgs,
  lib,
  fetchFromGitHub,
  ...
}:
pkgs.stdenv.mkDerivation rec {
  pname = "ziti-edge-tunnel";
  version = "1.6.1";

  # https://github.com/openziti/ziti-tunnel-sdk-c/blob/main/BUILD.md
  src = fetchFromGitHub {
    owner = "openziti";
    repo = "ziti-tunnel-sdk-c";
    tag = "v${version}";
    #hash = "sha256-KJQ1kAIsRlQtnq7z6jTfbbcrikJ/5DeFiYRmPAdTLc8=";
    hash = "sha256-gDg0amOSW71d1y9ZnGUsB90imndXtKJNsg+nb+g/6sU=";
    leaveDotGit = true;
  };
  ziti_sdk_src = fetchFromGitHub {
    owner = "openziti";
    repo = "ziti-sdk-c";
    rev = "1.7.0";
    hash = "sha256-Gw5Oa0uGFO6TFS1pDkzTq6U354ndnaRcS0yOlx6wm0Q=";
  };
  tlsuv_src = fetchFromGitHub {
    owner = "openziti";
    repo = "tlsuv";
    rev = "v0.36.1";
    hash = "sha256-Q0/R/DVZ5zVupAIArT4PC6L+Ji0LBlKvNn47d1p/Kro=";
  };
  lwip_src = fetchFromGitHub {
    owner = "lwip-tcpip";
    repo = "lwip";
    rev = "STABLE-2_2_1_RELEASE";
    hash = "sha256-8TYbUgHNv9SV3l203WVfbwDEHFonDAQqdykiX9OoM34=";
  };
  lwip_contrib_src = fetchFromGitHub {
    owner = "netfoundry";
    repo = "lwip-contrib";
    tag = "STABLE-2_1_0_RELEASE";
    hash = "sha256-Ypn/QfkiTGoKLCQ7SXozk4D/QIdo4lyza4yq3tAoP/0=";
  };
  subcommand_c_src = fetchFromGitHub {
    owner = "openziti";
    repo = "subcommands.c";
    rev = "87350797774530b6ba9c00017f0f53dd57e6c38e";
    hash = "sha256-Gz0/b9jcC1I0fmguSMkV0xiqKWq7vzUVT0Bd1F4iqkA=";
  };

  preConfigure = ''
    cp -r ${ziti_sdk_src} ./deps/ziti-sdk-c
    cp -r ${tlsuv_src} ./deps/tlsuv
    cp -r ${lwip_src} ./deps/lwip
    cp -r ${lwip_contrib_src} ./deps/lwip-contrib
    cp -r ${subcommand_c_src} ./deps/subcommand.c

    chmod -R +w .
  '';

  cmakeFlags = [
    #"-DDISABLE_SEMVER_VERIFICATION=ON"
    "-DZITI_SDK_DIR=${ziti_sdk_src}"
    "-DZITI_SDK_VERSION=1.7.0"
    "-Dtlsuv_DIR=${tlsuv_src}"
    "-DFETCHCONTENT_SOURCE_DIR_LWIP=${lwip_src}"
    "-DFETCHCONTENT_SOURCE_DIR_LWIP-CONTRIB=${lwip_contrib_src}"
    "-DFETCHCONTENT_SOURCE_DIR_SUBCOMMAND=${subcommand_c_src}"
    "-DBUILD_DOC=OFF"
    "-DDOXYGEN_OUTPUT_DIR=/tmp/doxygen"
    "-DFETCHCONTENT_FULLY_DISCONNECTED=ON"
  ];

  nativeBuildInputs = [
    pkgs.cmake
    pkgs.git
    pkgs.vcpkg
    pkgs.openssl
    pkgs.pkg-config
    pkgs.libuv
    pkgs.zlib
    pkgs.llhttp
    pkgs.libsodium
    pkgs.protobufc
    pkgs.json_c
    pkgs.systemd
    pkgs.doxygen
    pkgs.graphviz
  ];

  #buildPhase = ''
  #  #cd ./ziti-tunnel-sdk-c

  #  echo $TMPDDIR
  #  mkdir build
  #  cd build

  #  cmake --preset ci-linux-x64 ..
  #  cmake --build .
  #'';

  meta.main = "ziti-edge-tunnel";
}
