{ pkgs, ... }:
let
  dwarf-fortress = (pkgs.dwarf-fortress-packages.dwarf-fortress-full.override {
    dfVersion = "0.47.05";
    enableIntro = false;
    enableSound = false;
    enableFPS = true;
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
