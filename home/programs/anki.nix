{pkgs-unstable, ...}: let
  l = pkgs.lib // builtins;
  # TODO: switch out for 25.11, as 25.05 doesn't have ankiAddons
  pkgs = pkgs-unstable;
in {
  home.packages = [
    (pkgs.anki.withAddons (with pkgs.ankiAddons; [
      anki-connect
      review-heatmap

      (recolor.withConfig {
        config = l.fromJSON (l.readFile ../../static-files/configs/anki-recolor.json);
      })

      (passfail2.withConfig {
        config = {
          again_button_name = "not quite";
          good_button_name = "excellent";
        };
      })

      ## dunno how to get this to build, TODO: revisit later
      # (pkgs.anki-utils.buildAnkiAddon (finalAttrs: {
      #   pname = "crowd-anki";
      #   version = "0.9.5-unstable-2025-07-20";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "Stvad";
      #     repo = "CrowdAnki";
      #     rev = "907381102f22323e0a4f8eb49d536ad18de81ec5";
      #     hash = "sha256-0jUtONexswIOrRCpPVvTAwQZTATfyhffwYEtdahdUgo=";
      #   };
      #   sourceRoot = "${finalAttrs.src.name}/crowd_anki";
      # }))
    ]))
  ];
}
## addons reference
##
##
#   # When the add-on is already available in nixpkgs
#   pkgs.ankiAddons.anki-connect
#
#   # When the add-on is not available in nixpkgs
#   (pkgs.anki-utils.buildAnkiAddon (finalAttrs: {
#     pname = "recolor";
#     version = "3.1";
#     src = pkgs.fetchFromGitHub {
#       owner = "AnKing-VIP";
#       repo = "AnkiRecolor";
#       rev = finalAttrs.version;
#       sparseCheckout = [ "src/addon" ];
#       hash = "sha256-28DJq2l9DP8O6OsbNQCZ0pm4S6CQ3Yz0Vfvlj+iQw8Y=";
#     };
#     sourceRoot = "source/src/addon";
#   }))
#
#   # When the add-on needs to be configured
#   pkgs.ankiAddons.passfail2.withConfig {
#     config = {
#       again_button_name = "not quite";
#       good_button_name = "excellent";
#     };
#
#     user_files = ./dir-to-be-merged-into-addon-user-files-dir;
#   };
# ]
## TODO: these plugins
# https://ankiweb.net/shared/info/181243826 - hanzi stats
# https://ankiweb.net/shared/info/1084228676 - color confirmation
# https://ankiweb.net/shared/info/1247171202 - study time stats
# https://ankiweb.net/shared/info/993120073 - correct answers graph

