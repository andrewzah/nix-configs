{
  pkgs,
  lib,
  fetchFromGitHub,
  python3Packages,
  ...
}: let
  ufo-extractor = python3Packages.buildPythonPackage {
    pname = "ufo-extractor";
    version = "0.8.1-unstable-2025-07-12";
    pyproject = true;

    SETUPTOOLS_SCM_PRETEND_VERSION = "0.8.1";
    src = pkgs.fetchFromGitHub {
      owner = "robotools";
      repo = "extractor";
      rev = "c592006dfc74d452a332b20984087e2452ae6e8b";
      hash = "sha256-Sv4jUe+Hz+6ZkL+dA52vLuLQCaydY+0aRM4Ql+g6aCY=";
    };

    build-system = with python3Packages; [setuptools setuptools-scm];
    dependencies = with python3Packages; [fonttools fontfeatures];

    meta.homepage = "https://github.com/robotools/extractor";
    meta.license = lib.licenses.mit;
  };
in
  python3Packages.buildPythonApplication {
    pname = "trufont";
    version = "0.6.6-unstable-2025-03-09";
    pyproject = true;

    SETUPTOOLS_SCM_PRETEND_VERSION = "0.6.6";
    src = fetchFromGitHub {
      owner = "trufont";
      repo = "trufont";
      rev = "845249f22e5d9cccb7b120bfd625014b8627fdbd";
      hash = "sha256-bzaA3UTL7RrPRpLeisiUqwC+3u0LcAa19LFdoSJpJ1w=";
    };

    nativeBuildInputs = [pkgs.qt5.wrapQtAppsHook];
    buildInputs = [pkgs.qt5.qtbase];

    build-system = with python3Packages; [setuptools setuptools-scm];
    dependencies = with python3Packages; [
      booleanoperations
      defcon
      fonttools
      hsluv
      pyqt5
      ufo-extractor
      ufo2ft
    ];

    dontWrapQrApps = true;
    preFixup = ''
      wrapQtApp "$out/bin/trufont"
      #makeWrapperArgs+=("''${qtWrapperArgs[@]}")
    '';

    meta.homepage = "https://github.com/trufont/trufont";
    meta.license = lib.licenses.gpl3Only;
  }
