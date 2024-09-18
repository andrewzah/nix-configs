{
  pkgs,
  stdenv,
  writeScriptBin,
}:
writeScriptBin "cider" ''
  #!${stdenv.shell}
  set -euo pipefail

  exec ${pkgs.appimage-run}/bin/appimage-run \
    $HOME/opt/Cider-linux-appimage-x64.AppImage
''
