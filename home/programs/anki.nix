{pkgs, ...}: let
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
        "webCorsOriginList": [ "http://localhost" ]
      }
      EOF
    '';
  };

  #review-heatmap = pkgs.stdenv.mkDerivation {
  #  name = "review-heatmap";

  #  src = pkgs.fetchFromGitHub {
  #    owner = "glutanimate";
  #    repo = "review-heatmap";
  #    rev = "b796468e99037726c4e46740e3c6dd3b6d80df34";
  #    hash = "sha256-B43z4frHH8SQqHZ6bxp3PCyvibziZZkFdF7ubvq8rHs=";
  #  };

  #  installPhase = ''
  #    mkdir -p $out
  #    cp -r ./src/review_heatmap/* $out

  #    cat <<EOF > $out/meta.json
  #    {
  #      "mod": 1656553428,
  #      "name": "Review Heatmap",
  #      "homepage": "https://github.com/glutanimate/review-heatmap",
  #      "branch_index": 1,
  #      "disabled": false
  #    }
  #    EOF

  #    cat <<EOF > $out/config.json
  #    {}
  #    EOF
  #  '';
  #};

  anki_24-11 = pkgs.anki-bin.overrideAttrs (old: rec {
    version = "24.11";

    src = pkgs.fetchurl {
      url = "https://github.com/ankitects/anki/releases/download/${version}/anki-${version}-linux-qt6.tar.zst";
      hash = "sha256-JXn4oxhRODHh6b5hFFj393xMRlaJRVcbMJ5AyXr+jq8=";
    };
  });
in {
  # not fully done; anki settings & addon settings
  # still need to be done manually
  home.packages = [anki_24-11];

  xdg.dataFile = {
    "${mapAddonPath 2055492159}" = {
      source = anki-connect;
      recursive = true;
    };

    # TODO: build this plugin
    #"${mapAddonPath 1771074083}" = {
    #  source = review-heatmap;
    #  recursive = true;
    #};

    # TODO: these plugins
    # https://ankiweb.net/shared/info/181243826 - hanzi stats
    # https://ankiweb.net/shared/info/1084228676 - color confirmation
    # https://ankiweb.net/shared/info/1247171202 - study time stats
    # https://ankiweb.net/shared/info/876946123 - pass/fail 2
    # https://ankiweb.net/shared/info/993120073 - correct answers graph
  };
}
