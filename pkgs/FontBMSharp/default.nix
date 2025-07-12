{
  pkgs,
  lib,
  stdenv,
  fetchFromGitHub,
  buildDotnetModule,
  dotnetCorePackages,
  ...
}:
buildDotnetModule rec {
  pname = "FontBMSharp";
  version = "1.0.0";
  nugetDeps = ./deps.json;

  src = fetchFromGitHub {
    owner = "benbaker76";
    repo = "FontBMSharp";
    rev = "v${version}";
    hash = "sha256-F1I0kDi/7AoNgl/f1i7CW7zlIAswK+HcuS1f75pRLP0=";
  };
  projectFile = "${src}/FontBMSharp.sln";
  enableParallelBuilding = false;

  HOME = /tmp/a;
  DOTNET_CLI_HOME = "/tmp/a";

  dotnet-sdk = dotnetCorePackages.sdk_8_0;
  dotnet-runtime = dotnetCorePackages.runtime_8_0;
  executables = ["FontBMSharp"];
  dotnetBuildFlags = [
    "--no-self-contained"
  ];

  meta = {
    homepage = "https://github.com/benbaker76/FontBMSharp";
    license = lib.licenses.mit;
    sourceProvenance = [lib.sourceTypes.fromSource];
  };
}
