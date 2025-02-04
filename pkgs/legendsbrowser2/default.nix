{pkgs, fetchFromGitHub, buildGoModule, ...}:
buildGoModule rec {
  pname = "legendsbrowser2";
  version = "2.0.9";

  sourceRoot = "source/backend";
  src = fetchFromGitHub {
    owner = "robertjanetzko";
    repo = "LegendsBrowser2";
    rev = "${version}";
    hash = "sha256-oFxJOOGgPi3hAYGyHfjM/3PG6/vm9LV+tlGpDrdHjik=";
  };
  vendorHash = "sha256-W7hc+U+rJZgXzcYoUHTG29j2xvJ/xTbBgDaiO7CVGnk=";

  meta = {
    description = "A multi-platform, open source, legends viewer for dwarf fortress 0.47 written in go.";
    homepage = "https://github.com/robertjanetzko/LegendsBrowser2";
    license = pkgs.lib.licenses.mit;
  };
}
