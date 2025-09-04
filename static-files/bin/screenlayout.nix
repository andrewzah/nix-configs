{pkgs, ...}: let
  xrandrBin = pkgs.lib.getExe pkgs.xorg.xrandr;
  grepBin = pkgs.lib.getExe pkgs.gnugrep;
  i3MsgBin = "${pkgs.i3}/bin/i3-msg";
in
  pkgs.writeShellScriptBin "zscreenlayout" ''
    set -e

    export USER=dragon
    export DISPLAY=:0
    export XAUTHORITY="/home/$USER/.Xauthority"

    if ${xrandrBin} | ${grepBin} -q "HDMI-1 connected"; then
      ${xrandrBin} \
        --output eDP-1 \
        --primary \
        --mode 1920x1200 \
        --pos 0x120 \
        --rotate normal \
        --output HDMI-1 \
        --mode 3440x1440 \
        --pos 1920x0 \
        --rotate normal \
        --output DP-1 --off \
        --output DP-2 --off \
        --output DP-3 --off \
        --output DP-4 --off \
        --output DP-5 --off \
        --output DP-6 --off \
        --output DP-7 --off

      ${i3MsgBin} '[workspace="2"] move workspace to output HDMI-1'
      ${i3MsgBin} '[workspace="10"] move workspace to output HDMI-1'
    else
      ${xrandrBin} \
        --output eDP-1 \
        --primary \
        --mode 1920x1200 \
        --pos 0x0 \
        --rotate normal \
        --output HDMI-1 --off \
        --output DP-1 --off \
        --output DP-2 --off \
        --output DP-3 --off \
        --output DP-4 --off \
        --output DP-5 --off \
        --output DP-6 --off \
        --output DP-7 --off
    fi
  ''
