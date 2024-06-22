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
    #theme = pkgs.dwarf-fortress-packages.themes.spacefox;
    #theme = pkgs.dwarf-fortress-packages.themes.gemset;
    #theme = pkgs.dwarf-fortress-packages.themes.phoebus;
    #theme = pkgs.dwarf-fortress-packages.themes.vettlingr;
    #theme = pkgs.dwarf-fortress-packages.themes.wanderlust;
    #theme = pkgs.dwarf-fortress-packages.themes.taffer;
    #theme = pkgs.dwarf-fortress-packages.themes.rally-ho;
    #theme = pkgs.dwarf-fortress-packages.themes.obsidian;
    #theme = pkgs.dwarf-fortress-packages.themes.mayday;
    #theme = pkgs.dwarf-fortress-packages.themes.jolly-bastion;
    #theme = pkgs.dwarf-fortress-packages.themes.ironhand;
    #theme = pkgs.dwarf-fortress-packages.themes.afro-graphics;
    #theme = pkgs.dwarf-fortress-packages.themes.autoreiv;
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
