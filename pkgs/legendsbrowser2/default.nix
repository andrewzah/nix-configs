{
  pkgs,
  fetchFromGitHub,
  buildGoModule,
  ...
}:
buildGoModule rec {
  pname = "legendsbrowser2";
  version = "2.0.10";

  sourceRoot = "source/backend";
  src = fetchFromGitHub {
    owner = "robertjanetzko";
    repo = "LegendsBrowser2";
    rev = "${version}";
    hash = "sha256-wttBw3AKHkPCgoxnaxI8IZSPuw2xLoCK/9joAYFWPM8=";
  };
  vendorHash = "sha256-W7hc+U+rJZgXzcYoUHTG29j2xvJ/xTbBgDaiO7CVGnk=";

  meta = {
    description = "A multi-platform, open source, legends viewer for dwarf fortress 0.47 written in go.";
    homepage = "https://github.com/robertjanetzko/LegendsBrowser2";
    license = pkgs.lib.licenses.mit;
  };
}
