{pkgs, fetchFromGitHub, buildGoModule, ...}:
buildGoModule rec {
  pname = "hexowl";
  version = "1.5.1";

  src = fetchFromGitHub {
    owner = "DECE2183";
    repo = "hexowl";
    rev = "v${version}";
    hash = "sha256-d9ZS6H8scZmPl23Q226A5zuAtw3XS840runYU7/9b9Y=";
  };
  vendorHash = null;

  meta = {
    description = "Lightweight, flexible programmer's calculator with variables and functions ";
    homepage = "https://github.com/DECE2183/hexowl";
    license = pkgs.lib.licenses.gpl3Only;
  };
}
