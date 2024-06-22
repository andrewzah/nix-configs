{ pkgs, ... }:
let
  dwarf-fortress = (pkgs.dwarf-fortress-packages.dwarf-fortress-full.override {
    dfVersion = "0.47.05";
    enableIntro = false;
    enableSound = false;
    enableFPS = true;
    # taffer tergel spacefox phoebus gemset vettlingr wanderlust
    # https://search.nixos.org/packages?channel=24.05&from=0&size=50&sort=relevance&type=packages&query=dwarf-fortress-packages.themes
    theme = pkgs.dwarf-fortress-packages.themes.tergel;
    # ext programs
    enableDFHack = true;
    enableDwarfTherapist = true;
    enableLegendsBrowser = true;
    enableStoneSense = true;
  });
in
{
  home.packages = [ dwarf-fortress ];
}
