{
  pkgs,
  ...
}: let
  mapAddonPath = id: "Anki2/addons21/${toString id}";

  anki-connect = pkgs.stdenv.mkDerivation {
    name = "anki-connect";

    src = pkgs.fetchFromGitea {
      domain = "git.foosoft.net";
      owner = "alex";
      repo = "anki-connect";
      rev = "98e0bb35fb77fa3983347035f123065feb4c56e6";
      hash = "sha256-DM18g5ntmG0RPy8un9aEYKjqVXeAN+SrBv4CCzBV/1w=";
    };

    installPhase = ''
      mkdir -p $out
      cp -r ./plugin/* $out

      cat <<EOF > $out/meta.json
      {
        "name": "AnkiConnect",
        "mod": 1730943293,
        "min_point_version": 45,
        "max_point_version": 45,
        "branch_index": 1,
        "disabled": false
      }
      EOF

      cat <<EOF > $out/config.json
      {
        "apiKey": null,
        "apiLogPath": null,
        "webBindAddress": "127.0.0.1",
        "webBindPort": 8765,
        "webCorsOrigin": "http://localhost",
        "webCorsOriginList": [
          "http://localhost",
        ]
      }
      EOF
    '';
  };

  anki_24-11 = (pkgs.anki-bin.overrideAttrs (old: rec {
      version = "24.11";

      sources.linux = pkgs.fetchurl {
        url = "https://github.com/ankitects/anki/releases/download/${version}/anki-${version}-linux-qt6.tar.zst";
        hash = "";
      };

    }));

in {
  home.packages = [anki_24-11];

  xdg.dataFile = {
    "${mapAddonPath 2055492159}" = {
      source = anki-connect;
      recursive = true;
    };
  };
}
